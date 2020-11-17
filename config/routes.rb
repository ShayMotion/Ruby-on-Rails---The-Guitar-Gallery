Rails.application.routes.draw do
  root 'sessions#index'


  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  get "/signup" => "users#new"
  post "/signup" => "users#create"
 
  get "/auction" => "auctions#new"
  post "/auction" => "auctions#create"
  delete "/auction" => "auctions#destroy"

  get "/guitar" => "guitars#new"
  post "/guitar" => "guitars#create"
  delete "/guitar" => "guitars#destroy"

      resources :auctions do 
      resources :guitars 
      end
      resources :users

    end