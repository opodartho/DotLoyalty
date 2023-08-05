# frozen_string_literal: true

json.extract! campaign, :id, :name, :description, :campaign_type, :trigger, :active, :active_from, :active_to, :order,
              :store_id, :created_at, :updated_at
json.url campaign_url(campaign, format: :json)
