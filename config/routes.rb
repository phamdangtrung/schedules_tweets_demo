# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get 'about-us', to: 'about#index', as: :about

  # Register routes
  get 'register', to: 'registration#new'
  post 'register', to: 'registration#create'

  # Login routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  # Logout routes
  delete 'logout', to: 'sessions#destroy'
end
