class Rule < ApplicationRecord
  belongs_to :store
  belongs_to :campaign
  has_many :conditions
end
