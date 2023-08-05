require 'rails_helper'

RSpec.describe Units::Take do

  subject { described_class.new }

  let(:wallet) { create(:wallet) }
  let(:member) { create(:member) }


  it 'take member some points' do
    expect do
      subject.(wallet: wallet, member: member, amount: 10)
    end.to change(Transaction.credit, :count).by(1)
  end
end
