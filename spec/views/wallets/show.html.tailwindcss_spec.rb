# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'wallets/show' do
  before do
    assign(:wallet, create(:wallet))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Store/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Active/)
    expect(rendered).to match(/Singular/)
    expect(rendered).to match(/Plural/)
    expect(rendered).to match(/Expire unit method/)
  end
end
