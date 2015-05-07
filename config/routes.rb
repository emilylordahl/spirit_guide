Rails.application.routes.draw do

  root to: 'application#index'
  resources :markets, except: [:new, :edit]
  resources :businesses, except: [:new, :edit]
  resources :users

end
