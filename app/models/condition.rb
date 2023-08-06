class Condition < ApplicationRecord
  belongs_to :rule
  belongs_to :store
end
