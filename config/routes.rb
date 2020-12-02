Rails.application.routes.draw do

  # boiler plate routes
  resources :favorites, only: [:show, :index, :destroy]
  resources :users
  resources :models
  resources :vehicle_types
  resources :brands

  # custom routes
  delete "/sessions/logout", to: 'sessions#logout', as: 'logout'
  get "/sessions/new", to: 'sessions#new', as: 'new_login'
  post '/sessions/login', to: 'sessions#login', as: 'login'
  # post "model/:id/add", to: 'models#add_favorite', as: 'add_favorite'  
  put "favorites/:id/add", to: 'favorites#add', as: 'add_favorite'  


end
