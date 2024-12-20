Rails.application.routes.draw do
  resources :profiles
  devise_for :users

  resources :events do
    resources :e_comments
  end

  resources :meets do
    resources :m_comments
  end

  resources :communities, only: [ :index, :show ]

  resources :mailers, only: [ :create ]

  namespace :admin do
    resources :programs
    resources :faculties
    resources :communities, except: [ :index, :show ]
    resources :events, only: [ :create, :update ]
    resources :mailers
  end

  namespace :api, format: "json" do
    namespace :v1 do
      resources :events, only: [ :index, :show ]
      resources :meets, only: [ :index, :show ]
      resources :faculties, only: [ :index, :show ]
      resources :communities, only: [ :index, :show ]
    end
  end

  get "welcome/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get "welcome/index"
  get "welcome/about"

  # Defines the root path route ("/")
  root "welcome#index"
end
