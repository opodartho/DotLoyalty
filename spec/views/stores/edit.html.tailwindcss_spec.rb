# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'stores/edit' do
  let(:store) do
    create(:store)
  end

  before do
    assign(:store, store)
  end

  it 'renders the edit store form' do
    render

    assert_select 'form[action=?][method=?]', store_path(store), 'post' do
      assert_select 'input[name=?]', 'store[name]'

      assert_select 'input[name=?]', 'store[code]'
    end
  end
end
