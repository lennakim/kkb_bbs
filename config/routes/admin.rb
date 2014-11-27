namespace :admin do
  resources :topics

  resources :ads do
    collection do
      match 'search' => 'ad#search', via: [:get, :post], as: :search
    end
  end

  root "dashboard#index", as: :dashboard
end