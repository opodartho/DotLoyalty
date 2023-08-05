# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Units::Give do
  subject(:units_give) { described_class.new }

  let(:wallet) { create(:wallet) }
  let(:member) { create(:member) }
  let(:store) { create(:store) }

  it 'gives member some points' do
    expect do
      units_give.call(store:, wallet:, member:, amount: 10)
    end.to change(Transaction.debit, :count).by(1)
  end
end
