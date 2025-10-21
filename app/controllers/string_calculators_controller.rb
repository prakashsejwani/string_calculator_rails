class StringCalculatorsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    input = params[:numbers].to_s.gsub("\\n", "\n")
    result = StringCalculator.new.add(input)
    render json: { result: result }
  rescue NegativeNumbersError => e
    render json: { error: e.message }, status: :unprocessable_entity
  rescue ArgumentError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end


