# frozen_string_literal: true

FactoryBot.define do
  factory :store do
    name { Faker::Company.name }
    code { Faker::Company.sic_code }
  end
end
