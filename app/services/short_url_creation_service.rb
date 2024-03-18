# frozen_string_literal: true

require 'securerandom'

class ShortUrlCreationService

  def self.call(url)
    url.short_url = generate_short_urls
  end

  private

  def self.generate_short_url
    "https://tinyurl.com/#{SecureRandom.hex(8)}"
  end
end