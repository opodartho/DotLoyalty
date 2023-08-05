# frozen_string_literal: true

json.extract! wallet, :id, :store_id, :name, :description, :active, :singular, :plural, :expire_unit_method,
              :created_at, :updated_at
json.url wallet_url(wallet, format: :json)
