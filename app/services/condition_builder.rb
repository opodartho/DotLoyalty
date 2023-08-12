# frozen_string_literal: true

class ConditionBuilder
  OPERATORS = ['.', '[', ']', ':'].freeze

  def parse(tokens, data, operators)
    statement = ''

    tokens.each_with_index do |token, index|
      case token
      when '['
        statement += ".select { |a#{index}| a#{index}."
      when ':'
        statement += " #{operators.shift}"
        value = data.shift
        statement += value.is_a?(String) ? " '#{value}'" : " #{value}"
        statement += ' && '
      when ']'
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

    while str.length.positive?
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
      return field.presence, str[i..] unless alphanumeric?(c)

      field += c
    end

    [field, '']
  end

  def lex_operator(str)
    return str[0], str[1..] if OPERATORS.include?(str[0])

    [nil, str]
  end

  def alphanumeric?(char)
    char =~ /[[:alnum:]]/
  end
end
