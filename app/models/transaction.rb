# frozen_string_literal: true

class Transaction < ApplicationRecord

  enum :action, { debit: 0, credit: 1 }

  belongs_to :member
  belongs_to :wallet
end
