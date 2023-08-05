# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'members/index' do
  before do
    assign(:members, create_list(:member, 2))
  end

  it 'renders a list of members' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Gender'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Phone'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Store'.to_s), count: 2
  end
end
