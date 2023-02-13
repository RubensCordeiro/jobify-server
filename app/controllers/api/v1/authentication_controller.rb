# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < ApplicationController
      def register
        user = User.new(set_user_params)
        user.save!
        head :ok
      rescue StandardError => e
        render json: { error: e.summary }, status: 400
      end

      def login; end

      def update_user; end

      private

      def set_user_params
        {
          name: params[:name],
          email: params[:email],
          password: params[:password],
          lastName: params[:lastName],
          location: params[:location]
        }
      end
    end
  end
end
