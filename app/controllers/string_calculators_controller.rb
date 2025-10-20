class StringCalculatorsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    input = params[:numbers].to_s.gsub("\\n", "\n")
    result = StringCalculator.new.add(input)
    respond_to do |format|
      format.json { render json: { result: result } }
      format.html { render html: "Result: #{result}".html_safe }
    end
  rescue NegativeNumbersError => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
      format.html { render html: e.message, status: :unprocessable_entity }
    end
  end
end


