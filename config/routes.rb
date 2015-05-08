Rails.application.routes.draw do

  root to: 'application#index'
  
  resources :markets, except: [:new, :edit]
  resources :businesses, except: [:new, :edit]
  resources :users

  get 'sessions/new' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy'

end
