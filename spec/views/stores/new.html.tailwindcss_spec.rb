# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'stores/new' do
  before do
    assign(:store, build(:store))
  end

  it 'renders new store form' do
    render

    assert_select 'form[action=?][method=?]', stores_path, 'post' do
      assert_select 'input[name=?]', 'store[name]'

      assert_select 'input[name=?]', 'store[code]'
    end
  end
end
