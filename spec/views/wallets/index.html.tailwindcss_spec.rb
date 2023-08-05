# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'wallets/index' do
  before do
    assign(:wallets, create_list(:wallet, 2))
  end

  it 'renders a list of wallets' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Store'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Description'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Active'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Singular'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Plural'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Expire unit method'.to_s), count: 2
  end
end
