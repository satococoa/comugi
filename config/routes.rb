Comugi::Application.routes.draw do
  get "follows/index"

  get "pages/index"

  match "login" => redirect("/auth/twitter"), :as => :login
  match "auth/twitter/callback" => "sessions#create", :as => :callback
  match "logout" => "sessions#destroy", :as => :logout

  resources :followers, :only => [:index]

  root :to => 'pages#index'
end
