# frozen_string_literal: true

class Campaign < ApplicationRecord
  belongs_to :store
  has_many :rules, dependent: :destroy

  accepts_nested_attributes_for :rules, allow_destroy: true

  enum :campaign_type, { direct: 0, referral: 1 }
  enum :trigger, { transaction_event: 0, internal_event: 1, custom_event: 2, achievement: 3, redemption: 4 }
end
