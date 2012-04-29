Comugi::Application.routes.draw do
  get "requests/index"

  get "requests/create"

  get "requests/destroy"

  get "pages/index"

  match "login" => redirect("/auth/twitter"), :as => :login
  match "auth/twitter/callback" => "sessions#create", :as => :callback
  match "logout" => "sessions#destroy", :as => :logout

  resources :followers, :only => [:index]
  resources :follows, :only => [:index]

  root :to => 'pages#index'
end
