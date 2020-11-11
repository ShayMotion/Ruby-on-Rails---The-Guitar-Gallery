Rails.application.routes.draw do
  root 'sessions#index'
  
  # get 'auction/title'
  # get 'auction/start_date'
  # get 'auction/end_date'
  post "/login", to: "sessions#create"
  post "/signup", to: "users#create"
  delete "/logout", to: "sessions#destroy"
  # get "/get_current_user", to: "sessions#get_current_user"
      resources :brands
      resources :models
      resources :years
      resources :prices
      resources :guitars 
      resources :users
      resources :comments
    end
  end

