Rails.application.routes.draw do
  root 'sessions#index'


  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  get "/signup" => "users#new"
  post "/signup" => "users#create"
 
  get "/auctions/new" => "auctions#new", :as => "new_auction"
  post "/auctions" => "auctions#create"
  delete "/auctions/:id" => "auctions#destroy"

  get "/guitar/new" => "guitars#new"
  post "/guitars" => "guitars#create"
  delete "/guitars/:id" => "guitars#destroy"

  get "/users/new" => "users#new"
  post "/users" => "users#create"
  delete "/users/:id" => "users#destroy"
      resources :users
      resources :auctions do 
      resources :guitars 
      end
    

    end