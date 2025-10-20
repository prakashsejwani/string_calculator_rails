# frozen_string_literal: true

class NegativeNumbersError < StandardError
  def initialize(negative_numbers)
    super("negative numbers not allowed #{negative_numbers.join(',')}")
  end
end

class StringCalculator
  MAX_NUMBER = 1000
  DEFAULT_DELIMITERS = /[,
]/.freeze

  def add(numbers)
    return 0 if numbers == ''
    0
  end
end
