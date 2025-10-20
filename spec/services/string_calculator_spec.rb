# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'StringCalculator' do
  describe '#add' do
    it 'returns 0 for empty string' do
      calculator = StringCalculator.new
      expect(calculator.add('')).to eq(0)
    end

    it 'returns the number for single number' do
      calculator = StringCalculator.new
      expect(calculator.add('1')).to eq(1)
    end

    it 'returns sum for two comma-separated numbers' do
      calculator = StringCalculator.new
      expect(calculator.add('1,5')).to eq(6)
    end

    it 'returns sum for any amount of comma-separated numbers' do
      calculator = StringCalculator.new
      expect(calculator.add('1,2,3,4,5')).to eq(15)
    end

    it 'supports new lines between numbers' do
      calculator = StringCalculator.new
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'supports a custom single-char delimiter defined with //; prefix' do
      calculator = StringCalculator.new
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'raises with all negatives listed' do
      calculator = StringCalculator.new
      expect {
        calculator.add('1,-2,3,-4')
      }.to raise_error(NegativeNumbersError, 'negative numbers not allowed -2,-4')
    end

    it 'ignores numbers bigger than 1000' do
      calculator = StringCalculator.new
      expect(calculator.add('2,1001')).to eq(2)
    end

    it 'supports any-length delimiter using //[***] prefix' do
      calculator = StringCalculator.new
      expect(calculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it 'supports multiple delimiters //[delim1][delim2]' do
      calculator = StringCalculator.new
      expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
    end

    it 'supports multiple long delimiters' do
      calculator = StringCalculator.new
      expect(calculator.add("//[**][%%%]\n1**2%%%3")).to eq(6)
    end
  end
end
