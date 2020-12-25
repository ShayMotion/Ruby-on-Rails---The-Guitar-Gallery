Rails.application.routes.draw do
  root :to => 'sessions#index'


  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  get "/signup" => "users#new"
  post "/signup" => "users#create"
 
  get "/auctions/:id" => "auctions#show"
  get "/auction/new" => "auctions#new"
  post "/auctions" => "auctions#create"
  delete "/auctions/:id" => "auctions#destroy"

  get "/guitars" => "guitars#index"
  get "/guitars/:id" => "guitars#show"
  get "/guitars/new" => "guitars#new"
  post "/guitars" => "guitars#create"
  delete "/guitars/:id" => "guitars#destroy"

  get "/users/new" => "users#new"
  get "/users/:id" => "users#show"
  post "/users" => "users#create"
  delete "/users/:id" => "users#destroy"
      resources :users
      resources :auctions do 
      resources :guitars do
        resources :brands
        resources :models
        resources :years
        resources :prices
      resources :locations 
      end
    end
  end