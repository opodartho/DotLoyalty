# frozen_string_literal: true

class Wallet < ApplicationRecord
  # Didin't use enum as dont needed it's functationlity
  EXPIRE_METHODS = {
    'After X days' => 'after_x_days',
    is_all_time_active: 'is_all_time_active',
    at_the_end_of_the_month: 'at_the_end_of_the_month',
    at_the_end_of_the_xth_year: 'at_the_end_of_the_xth_year',
    units_will_expire_after: 'units_will_expire_after'
  }.freeze

  belongs_to :store
  has_many :transactions

  validates :name, :active, :singular, :plural, :expire_unit_method, presence: true
  validates :expire_unit_method, inclusion: { in: EXPIRE_METHODS.values }
end
