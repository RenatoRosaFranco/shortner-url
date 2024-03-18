# frozen_string_literal: true

Rails.application.routes.draw do

  # Healt check
  get "up" => "rails/health#show", as: :rails_health_check

  # API
  namespace :api do
    namespace :v1 do
      get 'shortUrl' => 'short_urls#show', param: :short_url
      post 'data/shorten' => 'short_urls#create'
    end
  end
end
