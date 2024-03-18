# frozen_string_literal: true

class ApplicationController < ActionController::Base

  private

  def not_found(model_name)
    render json: {
      message: "#{model_name} not found."
    }, status: :not_found
  end
end
