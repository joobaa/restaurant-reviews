Rails.application.routes.draw do
  resources :restaurants do
    # Custom routes relating to restaurants
    resources :reviews, only: [:new, :create]
    # Prefixes with /restaurants/:restaurant_id

    # Collections are *like* index routes in that they show a list of resources
    collection do
      get :top
      # GET /restaurants/top

      # get :london
      # # GET /restaurants/london
    end

    member do
      get :chef
      # GET /restaurants/42/chef

      # get :menu
      # # GET /restaurants/42/menu
    end
  end

  resources :reviews, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
