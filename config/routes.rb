Rails.application.routes.draw do
  get 'home/welcome'

  get 'login',     to: 'sessions#new', as: 'login'
  get 'service',   to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users

  resources :nodes

  resources :topics do
    resources :comments
    get :search, on: :collection
  end

  root "home#welcome"
end