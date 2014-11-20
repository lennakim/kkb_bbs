Rails.application.routes.draw do
  get 'home/welcome'

  get 'login',     to: 'sessions#new', as: 'login'
  get 'service',   to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :nodes

  resources :topics do
    resources :comments
    get :search, on: :collection
  end

  resources :topics
  resources :comments

  root "home#welcome"
end