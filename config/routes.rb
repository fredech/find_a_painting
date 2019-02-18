Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :paintings, only: [:index, :show, :new, :create, :edit, :update, :destroy ] do
    resources :bookings, only: [ :create ]
  end
  get "/search", to: "paintings#search", as: :search
  get "/dashboard", to: "users#dashboard", as: :dashboard

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
