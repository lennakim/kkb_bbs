namespace :admin do
  resources :topics

  resources :ads do
    collection do
      match 'search' => 'ad#search', via: [:get, :post], as: :search
    end
  end
  resources :slider do
    collection do
      match 'search' => 'slider#search', via: [:get, :post], as: :search
    end
  end
  resources :nodes do
    collection do
      match 'search' => 'nodes#search', via: [:get, :post], as: :search
    end
  end

  root "dashboard#index", as: :dashboard
end