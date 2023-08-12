# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :campaigns
  resources :members
  resources :wallets
  resources :users
  root 'campaigns#index'
end
