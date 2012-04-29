Comugi::Application.routes.draw do
  get "followers/index"

  get "pages/index"

  match "login" => redirect("/auth/twitter"), :as => :login
  match "auth/twitter/callback" => "sessions#create", :as => :callback
  match "logout" => "sessions#destroy", :as => :logout

  root :to => 'pages#index'
end
