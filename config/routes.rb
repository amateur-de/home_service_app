# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :admin_users
  resources :services do
    collection do
      get :pending
      get :approved
      get :rejected
      get :available
      get :availed
    end

    resources :bookings
    resources :reviews
    resources :comments
  end

  root 'welcome#index'
end
