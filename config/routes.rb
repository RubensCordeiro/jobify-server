# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :jobs
      mount_devise_token_auth_for 'User', at: 'auth'

      scope :jobs do
        get 'show_stats', to: 'jobs#showStats'
      end

      scope :auth do
        post '/register', to: 'authentication#register'
        post '/login', to: 'authentication#login'
        patch '/update_user', to: 'authentication#update_user'
      end
    end
  end
end
