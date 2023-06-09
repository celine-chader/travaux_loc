Rails.application.routes.draw do
  devise_for :users
  root to: "ads#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :ads do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:edit, :update]
  get "/dashboard", to: "pages#dashboard"
  post "/booking-accept/:id", to: "bookings#accept", as: :accept
  post "/booking-decline/:id", to: "bookings#decline", as: :decline
  # Defines the root path route ("/")
  # root "articles#index"
end
