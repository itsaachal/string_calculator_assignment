require_relative 'string_calculator'
require 'rspec'

describe StringCalculator do
  describe '#add' do
    it 'returns 0 for an empty string' do
      calculator = StringCalculator.new
      result = calculator.add('')
      expect(result).to eq(0)
    end

    it 'returns the sum for a single number' do
      calculator = StringCalculator.new
      result = calculator.add('5')
      expect(result).to eq(5)
    end

    it 'returns the sum for two numbers separated by a comma' do
      calculator = StringCalculator.new
      result = calculator.add('10,20')
      expect(result).to eq(30)
    end

    it 'returns the sum for numbers separated by commas and newlines' do
      calculator = StringCalculator.new
      result = calculator.add("10,20\n30")
      expect(result).to eq(60)
    end

    it 'raises an error for negative numbers' do
      calculator = StringCalculator.new
      expect { calculator.add("10,-5,20\n-30") }.to raise_error(ArgumentError, "Negatives not allowed: -5,-30")
    end
  end
end