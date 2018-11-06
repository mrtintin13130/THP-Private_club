Rails.application.routes.draw do
  resources :register, only: [:new, :create]
  resources :home, only: [:index]
  resources :user

  get '/login', to: 'user#login'
  post '/login', to: 'user#check'
  get '/logout', to: 'user#logout'
  root 'home#index'
end
