Rails.application.routes.draw do
  root :to => 'sessions#index'

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy", as: "logout"
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get "/signup" => "users#new"
  post "/signup" => "users#create"
  
  # resource :auction
  get "/auctions" => "auctions#index"
  get "/auctions/new" => "auctions#new"
  get "/auctions/:id" => "auctions#show", as: "auction"
  post "/auctions" => "auctions#create"
  delete "/auctions/:id" => "auctions#destroy"
  
  get "/users/:id/auctions" => "users#auctions", as: "user_auctions" # nested index

  get "/guitars" => "guitars#index"

  # resource :user do 
  #   resource :guitar
  # end
  
  get "/users/:user_id/guitars" => "users#guitars", as: "user_guitars" # nested index
  get "/users/:user_id/guitars/new" => "guitars#new", as: "guitars_new" # nested new
  get "/users/:user_id/guitars/:id" => "guitars#show", as: "guitar" # nested show
  post "/users/:user_id/guitars" => "guitars#create" # nested create
  delete "/users/:user_id/guitars/:id" => "guitars#destroy" # nested destroy

  get "/users/new" => "users#new"
  get "/users/:id" => "users#show", as: "user"
  post "/users" => "users#create"
  delete "/users/:id" => "users#destroy"
  
  get "/auctions/:auction_id/drums" => "drums#index"
  get "/drums" => "drums#index" 
  get "/drums/new" => "drums#new"
  post "/drums" => "drums#create"

  get "/users/:user_id/drums" => "users#drums", as: "user_drums" # nested index
  get "/users/:user_id/drums/:id" => "drums#show", as: "drum" # nested show
  post "/users/:user_id/drums" => "drums#create" # nested create
  delete "/users/:user_id/drums/:id" => "drums#destroy" # nested destroy

  # resource :user # "/users/5"
  # resource :drum # "/drums/4"
  # resource :guitar # "/guitars/5"
  # resource :auction # "/auctions/4"
  

  # resource :user do # "/users/5"
  #   resource :drum # "/users/10/drums/3"
  #   resource :guitar # "/users/10/guitars/3"
  # end
  # resource :auction # "/auctions/4"
end