# frozen_string_literal: true

class Store < ApplicationRecord
  after_initialize :set_code

  has_many :campaigns, dependent: :destroy

  validates :name, presence: true
  validates_uniqueness_of :code

  class << self
    def human_attribute_name(attribute_key_name, options = {})
      case attribute_key_name
      when 'name', :name
        'Store Name'
      else
        super
      end
    end
  end

  private

  def set_code
    self.code ||= Digest::SHA1.hexdigest("--#{srand}--#{Time.now}--")[..5].upcase
  end
end
