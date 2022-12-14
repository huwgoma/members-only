Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "posts#index"

  devise_scope :user do 
    get "users", to: "devise/sessions#new"
  end
  
  devise_for :users
  
  resources :posts
  get "about", to: "about#index"
end
