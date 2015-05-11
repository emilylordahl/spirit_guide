Rails.application.routes.draw do

  root to: 'application#index'
  
  resources :markets, except: [:new, :edit, :show]
  resources :businesses, except: [:new, :edit, :show]
  resources :users

  get 'sessions/new' => 'sessions#new', as: :login
  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy', as: :logout 

  get 'businesses/search' => 'businesses#search'
  get 'markets/search' => 'markets#search'


end
