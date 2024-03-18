# frozen_string_literal: true

class UrlSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :short_url
end
