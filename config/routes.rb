Rails.application.routes.draw do
  get 'home/welcome'

  get 'login',     to: 'sessions#new', as: 'login'
  get 'service',   to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  concern :likeable do
    resource :like, only: [:create, :destroy]
  end

  resources :users do
    resources :comments
    resources :notifications
    resources :topics
  end

  resources :nodes

  resources :topics do
    resources :comments do
      member do
        delete :trash
      end
    end

    collection do
      get :search
    end

    member do
      delete :trash
    end
  end

  namespace :admin do
    resources :topics
    resources :ads do
      collection do
        match 'search' => 'ad#search', via: [:get, :post], as: :search
      end
    end
  end

  root "home#welcome"
end