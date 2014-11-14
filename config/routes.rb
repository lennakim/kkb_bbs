Rails.application.routes.draw do
  get 'home/welcome'

  resources :nodes

  resources :posts do
    get :search, on: :collection
  end

  root "home#welcome"
end