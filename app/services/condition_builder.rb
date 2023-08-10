class ConditionBuilder
  OPERATORS = ['.', '[', ']', ':']

  def parse(tokens, data, operators)
    statement = ''

    tokens.each_with_index do |token, index|
      if token.eql?('[')
        statement += ".select { |a#{index}| a#{index}."
      elsif token.eql?(':')
        statement += " #{operators.shift}"
        value = data.shift
        statement += value.is_a?(String) ? " '#{value}'" : " #{value}"
        statement += ' && '
      elsif token.eql?(']')
        operator = operators.shift
        statement += " #{operator}" if operator.present?
        value = data.shift
        statement += value.is_a?(String) ? " '#{value}'" : " #{value}" if value.present?
        statement += ' }'
      else
        statement += token
      end
    end

    operators.each_with_index do |operator, index|
      statement += " #{operator}"
      value = data[index]
      statement += value.is_a?(String) ? " '#{value}'" : " #{value}"
    end

    statement
  end

  def lex(str)
    tokens = []

    while str.length > 0 do
      token, str = lex_field(str)

      if token.present?
        tokens.push(token)
        next
      end

      token, str = lex_operator(str)

      if token.present?
        tokens.push(token)
        next
      end

      raise "Unexpected character: #{str&.first}"

    end

    tokens
  end

  private

  def lex_field(str)
    field = ''

    str.each_char.with_index do |c, i|
      if alphanumeric?(c)
        field += c
      else
        return field.present? ? field : nil, str[i..]
      end
    end

    return field, ''
  end

  def lex_operator(str)
    if OPERATORS.include?(str[0])
      return str[0], str[1..]
    else
      return nil, str
    end
  end

  def alphanumeric?(char)
    char =~ /[[:alnum:]]/
  end
end
