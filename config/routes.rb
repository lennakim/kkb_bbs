class ActionDispatch::Routing::Mapper
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end
end

Rails.application.routes.draw do
  get 'home/welcome'

  get 'login',     to: 'sessions#new', as: 'login'
  get 'service',   to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  concern :likeable do
    resource :like, only: [:create, :destroy]
  end

  resources :users do
    member do
      get :topics
      get :comments
      get :notifications
    end
  end

  resources :nodes

  resources :topics, concerns: [:likeable] do
    get :search, on: :collection
    delete :trash, on: :member
  end

  resources :comments, concerns: [:likeable] do
    delete :trash, on: :member
  end

  root "home#welcome"

  draw :admin
end