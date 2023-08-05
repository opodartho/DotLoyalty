# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction do
  subject(:transaction) do
    build(:transaction, store_id: create(:store).id)
  end

  it 'is valid with valid attributes' do
    expect(transaction).to be_valid
  end
end
