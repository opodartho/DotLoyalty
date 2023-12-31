# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'campaigns/show' do
  before do
    assign(:campaign, create(:campaign))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(//)
  end
end
