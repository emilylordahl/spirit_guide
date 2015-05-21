Rails.application.routes.draw do

  root to: 'application#index'
  
  resources :users, except: :index do 
  	member do
  		put 'add_market', as: :add_market_to
  		put 'remove_market', as: :remove_market_from
  		put 'add_business', as: :add_business_to
  		put 'remove_business', as: :remove_business_from
  	end 
  end

  # Sessions Routes
  get 'sessions/new' => 'sessions#new', as: :login
  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy', as: :logout 

  # API Search Routes
  get 'businesses/search' => 'businesses#search'
  get 'markets/search' => 'markets#search'

  resources :markets

  resources :businesses
  
end
