# frozen_string_literal: true

FactoryBot.define do
  factory :member do
    name { 'MyString' }
    gender { 'MyString' }
    phone { '8801833182696' }
    birth_date { '2023-08-05' }
    store
  end
end
