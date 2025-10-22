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
    
    # Handle single number case - must check if it's > 1000
    if numbers !~ DEFAULT_DELIMITERS && !numbers.start_with?("//")
      single_number = numbers.to_i
      return single_number > MAX_NUMBER ? 0 : single_number
    end

    if numbers.start_with?("//")
      header, body = numbers.split("\n", 2)
      raise ArgumentError, "Invalid custom delimiter format" if body.nil?

      # Prefer bracketed delimiter(s) first
      if header.start_with?("//[")
        delimiters = header.scan(/\[(.*?)\]/).flatten
        pattern = Regexp.union(delimiters)
        values = body.split(pattern).map(&:to_i).reject { |n| n > MAX_NUMBER }
        negatives = values.select { |n| n < 0 }
        raise NegativeNumbersError, negatives if negatives.any?
        return values.sum
      else
        # Simple custom delimiter form: //;\n
        custom_delimiter = header[2]
        values = body.split(custom_delimiter).map(&:to_i).reject { |n| n > MAX_NUMBER }
        negatives = values.select { |n| n < 0 }
        raise NegativeNumbersError, negatives if negatives.any?
        return values.sum
      end
    end

    values = numbers.split(DEFAULT_DELIMITERS).map(&:to_i).reject { |n| n > MAX_NUMBER }
    negatives = values.select { |n| n < 0 }
    raise NegativeNumbersError, negatives if negatives.any?
    values.sum
  end
end
