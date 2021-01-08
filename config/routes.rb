Rails.application.routes.draw do
  root :to => 'sessions#index'

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy", as: "logout"
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get "/signup" => "users#new"
  post "/signup" => "users#create"
 
  get "/auctions" => "auctions#index"
  get "/auctions/new" => "auctions#new"
  get "/auctions/:id" => "auctions#show", as: "auction"
  post "/auctions" => "auctions#create"
  delete "/auctions/:id" => "auctions#destroy"
  get "/users/:id/auctions" => "users#auctions", as: "user_auctions" # nested index

  get "/guitars" => "guitars#index"
  get "/users/:user_id/guitars" => "users#guitars", as: "user_guitars" # nested index
  get "/users/:user_id/guitars/new" => "guitars#new", as: "guitars_new" # nested new
  get "/users/:user_id/guitars/:id" => "guitars#show", as: "guitar" # nested show
  post "/users/:user_id/guitars" => "guitars#create" # nested create
  delete "/users/:user_id/guitars/:id" => "guitars#destroy" # nested destroy

  get "/users/new" => "users#new"
  get "/users/:id" => "users#show", as: "user"
  post "/users" => "users#create"
  delete "/users/:id" => "users#destroy"
  
  
  

end