# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction do
  subject(:transaction) do
    build(:transaction)
  end
  
  it 'is valid with valid attributes' do
    expect(transaction).to be_valid
  end
end
