Rails.application.routes.draw do
  root 'sessions#index'

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  get "/signup" => "users#new"
  post "/signup" => "users#create"
 
      resources :auctions do 
      resources :guitars 
      resources :users
     end
    end