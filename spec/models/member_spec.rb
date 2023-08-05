# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Member do
  subject(:member) do
    build(:member)
  end

  it 'is valid with valid attributes' do
    expect(member).to be_valid
  end
end
