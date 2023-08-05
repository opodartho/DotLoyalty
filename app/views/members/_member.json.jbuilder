# frozen_string_literal: true

json.extract! member, :id, :name, :gender, :phone, :birth_date, :store_id, :created_at, :updated_at
json.url member_url(member, format: :json)
