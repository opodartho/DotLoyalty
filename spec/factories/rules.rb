# frozen_string_literal: true

FactoryBot.define do
  factory :rule do
    order { 1 }
    store { nil }
    campaign { nil }
  end
end
