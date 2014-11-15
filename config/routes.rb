Rails.application.routes.draw do
  get 'home/welcome'

  resources :nodes

  resources :posts do
    resources :comments
    get :search, on: :collection
  end

  resources :comments

  root "home#welcome"
  resources :posts
end