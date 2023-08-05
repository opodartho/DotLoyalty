# frozen_string_literal: true

module Units
  class Take
    include Dry::Transaction

    step :sub

    private

    def sub(input)
      Transaction.create!(
        member: input[:member],
        wallet: input[:wallet],
        amount: input[:amount],
        store: input[:store],
        action: 'credit'
      )
      Success(input)
    end
  end
end
