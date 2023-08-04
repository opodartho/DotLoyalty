# frozen_string_literal: true

class Store < ApplicationRecord
  validates :name, :code, presence: true
end
