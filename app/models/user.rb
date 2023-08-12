# frozen_string_literal: true

class User < ApplicationRecord
  attribute :agreement, :boolean
  devise(
    :confirmable,
    :database_authenticatable,
    :invitable,
    :lockable,
    :recoverable,
    :registerable,
    :rememberable,
    :timeoutable,
    :trackable,
    :validatable
  )

  belongs_to :store
  accepts_nested_attributes_for :store

  validates :name, :agreement, presence: true

  class << self
    def human_attribute_name(attribute_key_name, options = {})
      case attribute_key_name
      when 'name', :name
        'Full Name'
      else
        super
      end
    end
  end

end
