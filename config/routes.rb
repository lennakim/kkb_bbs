Rails.application.routes.draw do
  get 'home/welcome'

  get 'service', to: 'sessions#create'
  get 'sign_up', to: 'users#new', as: 'signup'
<<<<<<< HEAD
  get 'login', to: 'sessions#new', as: 'login'
=======
  get 'login',   to: 'sessions#new', as: 'login'
>>>>>>> 4b1b633a3f06313cc2377d70092095e7c259c517
  delete 'logout', to: 'sessions#destroy'

  root "home#welcome"
end