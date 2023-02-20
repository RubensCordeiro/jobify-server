# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < ApplicationController
      def register
        user = User.new(set_user_params)
        user.save!
        render json: { data: 'User created'}, status: 200
      rescue StandardError => e
        render json: { data: e.summary }, status: 400
      end

      def login; end

      def update_user; end

      private

      def set_user_params
        {
          name: params[:name],
          email: params[:email],
          password: params[:password],
          password_confirmation: params[:password_confirmation],
          lastName: params[:lastName],
          location: params[:location],
          uid: set_unique_uid
        }
      end

      def set_unique_uid
        uid_candidate = SecureRandom.uuid
        loop do
          user_uids = User.all.pluck('uid')
          break unless user_uids.include?(uid_candidate)
          uid_candidate = SecureRandom.uuid
        end
        uid_candidate
      end

    end
  end
end
