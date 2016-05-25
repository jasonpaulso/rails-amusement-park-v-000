Rails.application.routes.draw do
  # resources :users
  # resources :attractions
  # resources :rides
  # root 'static#home'
  # get '/signin', to: 'sessions#new'
  # post '/signin', to: 'sessions#create'
  # delete 'sessions/destroy', to: 'sessions#destroy', as: 'destroy_session'
  # post '/sessions/create', to: 'sessions#create'

  root 'static#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  resources :users
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  resources :rides, only: [:new, :create]
end