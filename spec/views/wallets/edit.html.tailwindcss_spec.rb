# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'wallets/edit' do
  let(:wallet) do
    create(:wallet)
  end

  before do
    assign(:wallet, wallet)
  end

  it 'renders the edit wallet form' do
    render

    assert_select 'form[action=?][method=?]', wallet_path(wallet), 'post' do
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
