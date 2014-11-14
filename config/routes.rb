Rails.application.routes.draw do
  get 'home/welcome'

  root "home#welcome"
  resources :posts
end