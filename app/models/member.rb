# frozen_string_literal: true

class Member < ApplicationRecord
  belongs_to :store
  has_many :transactions, dependent: :destroy
end
