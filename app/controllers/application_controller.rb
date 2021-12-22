class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

  private 

  def invalid_record
    render json: {error: "Invalid Record"}, status: :unprocessable_entity
  end 
end
