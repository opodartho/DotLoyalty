# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users
  resources :campaigns
  resources :members
  resources :wallets
  resources :stores
  root 'campaigns#index'
end
