Rails.application.routes.draw do
  get 'home/welcome'
  get 'service', to: 'sessions#create'
  get 'sign_up', to: 'users#new', as: 'signup'
  get 'login',   to: 'sessions#new', as: 'login'

  delete 'logout', to: 'sessions#destroy'

  root "home#welcome"
end