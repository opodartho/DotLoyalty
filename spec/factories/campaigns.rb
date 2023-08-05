# frozen_string_literal: true

FactoryBot.define do
  factory :campaign do
    name { 'MyString' }
    description { 'MyText' }
    campaign_type { 1 }
    trigger { 1 }
    active { false }
    active_from { '2023-08-06 01:33:47' }
    active_to { '2023-09-06 01:33:47' }
    order { 1 }
    store
  end
end
