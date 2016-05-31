Rails.application.routes.draw do
  get 'sessions/new'

  get 'signup' => 'users#new'
  resources :users, except: [:index]
  resources :notes
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'about' => 'pages#about'
  root 'pages#home'
end
