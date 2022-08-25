Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "posts#index"
  devise_for :users
  resources :posts, only: [:index, :new, :create, :show]
  get "about", to: "about#index"
end
