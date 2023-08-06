# frozen_string_literal: true

class Campaign < ApplicationRecord
  belongs_to :store
  has_many :rules, dependent: :destroy
end
