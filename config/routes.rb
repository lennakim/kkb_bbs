Rails.application.routes.draw do
  get 'home/welcome'

  get 'login',   to: 'sessions#new', as: 'login'
  get 'service', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :nodes

  resources :posts do
    resources :comments
    get :search, on: :collection
  end

  resources :comments

  root "home#welcome"
  resources :posts
end