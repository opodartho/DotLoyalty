# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'wallets/new' do
  before do
    assign(:wallet, build(:wallet))
  end

  it 'renders new wallet form' do
    render

    assert_select 'form[action=?][method=?]', wallets_path, 'post' do
      assert_select 'select[name=?]', 'wallet[store_id]'

      assert_select 'input[name=?]', 'wallet[name]'

      assert_select 'textarea[name=?]', 'wallet[description]'

      assert_select 'input[name=?]', 'wallet[active]'

      assert_select 'input[name=?]', 'wallet[singular]'

      assert_select 'input[name=?]', 'wallet[plural]'

      assert_select 'input[name=?]', 'wallet[expire_unit_method]'
    end
  end
end
