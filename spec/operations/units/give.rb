require 'rails_helper'

RSpec.describe Units::Give do

  subject { described_class.new }

  let(:wallet) { create(:wallet) }
  let(:member) { create(:member) }


  it 'gives member some points' do
    expect do
      subject.(wallet: wallet, member: member, amount: 10)
    end.to change(Transaction.debit, :count).by(1)
  end
end
