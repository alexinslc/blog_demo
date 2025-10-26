# frozen_string_literal: true

Rails.application.routes.draw do
  # Health check endpoint for Docker/k8s
  get 'up' => 'rails/health#show', as: :rails_health_check

  get 'users/profile'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get '/u/:id', to: 'users#profile', as: 'user'
  resources :posts
  get 'about', to: 'pages#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'
end
