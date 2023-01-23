# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :admin_users
  resources :services do
    resources :bookings
    resources :reviews
    resources :comments
  end
  resources :available_services do
    resources :bookings
    resources :reviews
  end
  resources :availed_services do
    resources :bookings
    resources :reviews
  end
  resources :pending_services
  resources :approved_services, only: [:index]
  resources :rejected_services, only: [:index]
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
