
require 'rails_helper'

RSpec.describe ConditionBuilder do
  subject(:cb) { described_class.new }

  describe 'expression without operators' do
    it 'return tokens array' do
      expect(cb.lex('abc')).to eq(['abc'])
    end
  end

  describe 'expression with operators' do
    it 'return tokens array' do
      expect(cb.lex('abc.def')).to eq(['abc', '.', 'def'])
      expect(cb.lex('abc.def.ghi')).to eq(['abc', '.', 'def', '.', 'ghi'])
      expect(cb.lex('abc.def[ghi]')).to eq(['abc', '.', 'def', '[', 'ghi', ']'])
      expect(cb.lex('abc.def[ghi[jkl:mnp]]')).to eq(['abc', '.', 'def', '[', 'ghi', '[', 'jkl', ':', 'mnp', ']', ']'])
    end
  end

  describe 'parse and build' do
    it 'return executable statement' do
      expect(cb.parse(['abc'], ['ef'], ['='])).to eq("abc = 'ef'")
      expect(cb.parse(['abc', '.', 'def'], [10], ['>='])).to eq('abc.def >= 10')
    end

    it 'return executable statement for array' do
      expect(cb.parse(['abc', '.', 'def', '[', 'ghi', ']'], [10], ['>='])).to eq('abc.def.select { |a3| a3.ghi >= 10 }')
      expect(cb.parse(['abc', '.', 'def', '[', 'ghi', ']'], ['jk'], ['>='])).to eq("abc.def.select { |a3| a3.ghi >= 'jk' }")
    end

    it 'return executable statement for nested array' do
      expect(cb.parse(['abc', '.', 'def', '[', 'ghi', '[', 'jkl', ':', 'mnp', ']', ']'], ['qr', 20], ['=', '>='])).to eq("abc.def.select { |a3| a3.ghi.select { |a5| a5.jkl = 'qr' && mnp >= 20 } }")
    end
  end
end
