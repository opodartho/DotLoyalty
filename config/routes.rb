# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for(
    :users,
    path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register' },
    controllers: { invitations: 'users/invitations' }
  )
  resources :campaigns
  resources :members
  resources :wallets
  resources :users
  root 'campaigns#index'

  namespace :api do
    namespace :v1 do
      scope ':store_id' do
        resources :transactions, only: %i[create]
      end
    end
  end
end
