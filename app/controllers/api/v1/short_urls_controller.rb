# frozen_string_literal: true

module API
  module V1
    class ShortUrlsController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: -> { not_found('Url') }

      before_action :set_url, only: [:show]

      def create
        url = Url.new(url_params)

        if url.save
          render json: {
            short_url: url.short_url
          }, status: 200
        else
          render json: {
            message: url.errors.full_messages.first
          }, status: :unprocessable_entity
        end
      end
      
      def show
        redirect_to @url.long_url
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