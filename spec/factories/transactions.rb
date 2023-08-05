# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    store
    member
    wallet
    amount { 10 }
    action { 'debit' }
    active { true }
  end
end
