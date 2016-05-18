Rails.application.routes.draw do
  get 'users/new'
  resources :users, except: [:index]

  root 'pages#home'
end
