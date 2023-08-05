# frozen_string_literal: true

FactoryBot.define do
  factory :wallet do
    store
    name { Faker::Currency.name }
    description { Faker::Lorem.sentence }
    active { true }
    singular { 'Point' }
    plural { 'Points' }
    expire_unit_method { 'is_all_time_active' }
  end
end
