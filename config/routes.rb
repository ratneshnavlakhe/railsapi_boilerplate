require 'api_constraints'

Rails.application.routes.draw do
  use_doorkeeper

  devise_for :users, defaults: { format: :json },
  only: :registrations,
  controllers: {
    registrations: 'users/registrations'
  }

  namespace :api, defaults: { format: :json }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      # We are going to list our resources here
      get 'users/sync', to: 'users#sync'
    end
    # scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
    # end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
