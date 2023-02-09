# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :jobs

      scope :auth do
        post '/register', to: 'authentication#register'
        post '/login', to: 'authentication#login'
        patch '/update_user', to: 'authentication#update_user'
      end
    end
  end
end
