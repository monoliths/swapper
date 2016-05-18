Rails.application.routes.draw do
  get 'sessions/new'

  get 'signup' => 'users#new'
  resources :users, except: [:index]
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  root 'pages#home'
end
