# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'members/new' do
  before do
    assign(:member, build(:member))
  end

  it 'renders new member form' do
    render

    assert_select 'form[action=?][method=?]', members_path, 'post' do
      assert_select 'input[name=?]', 'member[name]'

      assert_select 'input[name=?]', 'member[gender]'

      assert_select 'input[name=?]', 'member[phone]'

      assert_select 'input[name=?]', 'member[store_id]'
    end
  end
end
