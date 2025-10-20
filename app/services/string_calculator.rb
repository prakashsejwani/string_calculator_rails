# frozen_string_literal: true

class NegativeNumbersError < StandardError
  def initialize(negative_numbers)
    super("negative numbers not allowed #{negative_numbers.join(',')}")
  end
end

class StringCalculator
  MAX_NUMBER = 1000
  DEFAULT_DELIMITERS = /[,\n]/.freeze

  def add(numbers)
    return 0 if numbers == ""
    return numbers.to_i if numbers !~ DEFAULT_DELIMITERS
    numbers.split(DEFAULT_DELIMITERS).map(&:to_i).sum
  end
end
