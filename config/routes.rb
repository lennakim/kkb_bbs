Rails.application.routes.draw do
  get 'home/welcome'

  get 'login',     to: 'sessions#new', as: 'login'
  get 'service',   to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users do
    resources :comments
    resources :notifications
    resources :topics
  end

  resources :nodes

  resources :topics do
    resources :comments

    collection do
      get :search
    end
  end

  root "home#welcome"
end