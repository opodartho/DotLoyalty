# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'stores/show' do
  before do
    assign(:store, create(:store))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Code/)
  end
end
