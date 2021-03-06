Rails.application.routes.draw do
  devise_for :users
  root "timeline#index", as: :timeline
  get "timeline" => "timeline#index"
  get "/users" => "users#index"
  get "/users/:id" => "users#show", as: :user
  get "/follow/:id" => "users#follow", as: :follow_user

  resources :messages
end
