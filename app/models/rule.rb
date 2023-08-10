# frozen_string_literal: true

class Rule < ApplicationRecord
  belongs_to :store
  belongs_to :campaign
  has_many :conditions, dependent: :destroy

  accepts_nested_attributes_for :conditions, allow_destroy: true

  def store_id
    1
  end
end
