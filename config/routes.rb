require 'api_constraints'

Rails.application.routes.draw do
  get 'sessions/new'

  get 'signup' => 'users#new'
  resources :users, except: [:index]
  resources :notes
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'about' => 'pages#about'

  # this is where my api gets routed, api definition
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/' do
    scope module: :v1,
              constraints: ApiConstraints.new(version: 1, default: true) do
      # list resources here
    end
  end

  root 'pages#home'
end
