# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Campaign do
  subject(:campaign) do
    build(:campaign)
  end

  it 'is valid with valid attributes' do
    expect(campaign).to be_valid
  end
end
