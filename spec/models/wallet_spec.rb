# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Wallet do
  subject(:wallet) do
    build(:wallet, store: create(:store))
  end

  it 'is valid with valid attributes' do
    expect(wallet).to be_valid
  end

  it 'is not valid without a name' do
    wallet.name = nil
    expect(wallet).not_to be_valid
  end

  it 'is not valid without active' do
    wallet.active = nil
    expect(wallet).not_to be_valid
  end

  it 'is not valid without a singular' do
    wallet.singular = nil
    expect(wallet).not_to be_valid
  end

  it 'is not valid without a plural' do
    wallet.plural = nil
    expect(wallet).not_to be_valid
  end

  it 'is not valid without a expire_unit_method' do
    wallet.expire_unit_method = nil
    expect(wallet).not_to be_valid
  end

  it 'is not valid with a invalid expire_unit_method' do
    wallet.expire_unit_method = 'invalid_expire_unit_method'
    expect(wallet).not_to be_valid
  end
end
