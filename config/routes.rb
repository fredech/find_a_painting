Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :paintings, only: [:index, :show, :new, :create, :edit, :update, :destroy ] do
    resources :bookings, only: [ :edit, :update, :create ]
  end
  get "/dashboard", to: "pages#dashboard", as: :dashboard

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
