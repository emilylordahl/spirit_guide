Rails.application.routes.draw do

  root to: 'application#index'
  
  resources :users, except: :index

  # Sessions Routes
  get 'sessions/new' => 'sessions#new', as: :login
  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy', as: :logout 

  # API Search Routes
  get 'businesses/search' => 'businesses#search'
  get 'markets/search' => 'markets#search'

  resources :markets, except: [:show, :new, :edit, :update]

  resources :businesses, except: [:show, :new, :edit, :update]
  
end
