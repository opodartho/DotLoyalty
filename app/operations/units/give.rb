# frozen_string_literal: true

module Units
  class Give
    include Dry::Transaction

    step :add

    private

    def add(input)
      Transaction.create!(
        member: input[:member],
        wallet: input[:wallet],
        amount: input[:amount],
        store: input[:store],
        action: 'debit'
      )
      Success(input)
    end
  end
end
