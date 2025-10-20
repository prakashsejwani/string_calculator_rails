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
    return numbers.to_i if numbers !~ DEFAULT_DELIMITERS && !numbers.start_with?("//")

    if numbers.start_with?("//")
      header, body = numbers.split("\n", 2)
      # Simple custom delimiter form: //;\n
      if header[2] && header[2] != '['
        custom_delimiter = header[2]
        values = body.split(custom_delimiter).map(&:to_i)
        negatives = values.select { |n| n < 0 }
        raise NegativeNumbersError, negatives if negatives.any?
        return values.sum
      end
    end

    values = numbers.split(DEFAULT_DELIMITERS).map(&:to_i)
    negatives = values.select { |n| n < 0 }
    raise NegativeNumbersError, negatives if negatives.any?
    values.sum
  end
end
