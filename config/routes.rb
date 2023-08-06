# frozen_string_literal: true

Rails.application.routes.draw do
  resources :campaigns
  resources :members
  resources :wallets
  resources :stores
  root "campaigns#index"
end
