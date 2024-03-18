# frozen_string_literal: true

class ShortUrlCreationService

  def self.call
    generate_short_url
  end

  private

  def generate_short_url
    "https://tinyurl.com/#{SecureRandom.hex(8)}"
  end
end