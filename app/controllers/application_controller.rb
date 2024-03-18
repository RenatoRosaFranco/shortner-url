# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include HttpConcern
  include SerializationConcern

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
end
