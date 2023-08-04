# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store do
  subject(:store) do
    build(:store)
  end

  it 'is valid with valid attributes' do
    expect(store).to be_valid
  end

  it 'is not valid without a name' do
    store.name = nil
    expect(store).not_to be_valid
  end

  it 'is not valid without a code' do
    store.code = nil
    expect(store).not_to be_valid
  end
end
