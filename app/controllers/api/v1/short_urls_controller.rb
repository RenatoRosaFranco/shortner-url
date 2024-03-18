# frozen_string_literal: true

module Api
  module V1
    class ShortUrlsController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: -> { not_found('Url') }

      before_action :set_url, only: [:show]

      def create
        url = Url.new(url_params)

        if url.save
          render_response(:short_url, url, UrlSerializer)
        else
          render_error_response(url.errors.full_messages.first)
        end
      end
      
      def show
        redirect_to @url.long_url, allow_other_host: true
      end

      private

      def set_url
        @url = Url.find_by!(short_url: params[:short_url])
      end

      def url_params
        params.require(:url).permit(:long_url)
      end
    end
  end
end