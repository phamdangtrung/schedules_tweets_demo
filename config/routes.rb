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

  # Password routes
  get 'password/edit', to: 'password#edit', as: 'edit_password'
  patch 'password/edit', to: 'password#update'

  get 'password/reset', to: 'password_resets#new', as: 'reset_password'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit', as: 'confirmed_reset_password'
  patch 'password/reset/edit', to: 'password_resets#update'
end
