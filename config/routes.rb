Rails.application.routes.draw do
  devise_for :users
  root to: "ads#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :ads do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:edit, :update]
  get "/dashboard", to: "pages#dashboard"
  # get "/dashboard", to: "bookings#edit", as: :edit_booking
  # get "/dashboard", to: "bookings#update"
  # Defines the root path route ("/")
  # root "articles#index"
end
