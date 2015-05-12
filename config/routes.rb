Rails.application.routes.draw do

  root to: 'application#index'
  
  resources :users

  # Sessions Routes
  get 'sessions/new' => 'sessions#new', as: :login
  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy', as: :logout 

  # API Search Routes
  get 'businesses/search' => 'businesses#search'
  get 'markets/search' => 'markets#search'

  resources :markets do
  	member do
  		put 'add_user', as: :add_user_to
  		put 'remove_user', as: :remove_user_from
  	end 
  end

  resources :businesses do
  	member do
  		put 'add_user', as: :add_user_to
  		put 'remove_user', as: :remove_user_from
  	end 
  end

end
