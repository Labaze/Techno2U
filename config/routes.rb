Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users do
    resources :preferences, except: [ :show, :index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :parties, except: [ :new, :create ] do
    resources :attendings, only: [ :new, :create]
    resources :lineups, only: [ :new, :create, :destroy ]
  end
  resources :attendings, only: [ :destroy]
  resources :artists, only: [ :index, :show ]

  resources :profiles, only: :show
  resources :preferences, only: [ :new, :create ]

  resources :admin_interface, only: [:index]

  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
