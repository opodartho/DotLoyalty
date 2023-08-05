# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Units::Take do
  subject(:units_take) { described_class.new }

  let(:wallet) { create(:wallet) }
  let(:member) { create(:member) }
  let(:store) { create(:store) }

  it 'take member some points' do
    expect do
      units_take.call(store:, wallet:, member:, amount: 10)
    end.to change(Transaction.credit, :count).by(1)
  end
end
