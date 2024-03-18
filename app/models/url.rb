# frozen_string_literal: true

class Url < ApplicationRecord

  # Validations
  validates :short_url, presence: true, uniqueness: true

  # Methods
  def create_short_url
    ShortUrlCreationService.call(self)
  rescue Exception => e
    Rails.logger.error "Failed generate short_url: #{e.message}"
  end
end
