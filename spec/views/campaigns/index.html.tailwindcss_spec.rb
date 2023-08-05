# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'campaigns/index' do
  before do
    assign(:campaigns, create_list(:campaign, 2))
  end

  it 'renders a list of campaigns' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Description'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Campaign type'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Trigger'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Order'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Store'.to_s), count: 2
  end
end
