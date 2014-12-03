namespace :admin do
  resources :topics
  get '/topic/recycle' => 'topics#add_to_recycle'
  get '/recycle_list' => 'topics#recycle_topic'

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

  resources :users do
    collection do
      match 'search' => 'users#search', via: [:get, :post], as: :search
    end
  end

  root "dashboard#index", as: :dashboard
end