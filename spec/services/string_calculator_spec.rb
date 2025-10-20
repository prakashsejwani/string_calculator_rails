# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'StringCalculator' do
  describe '#add' do
    it 'returns 0 for empty string' do
      calculator = StringCalculator.new
      expect(calculator.add('')).to eq(0)
    end
  end
end
