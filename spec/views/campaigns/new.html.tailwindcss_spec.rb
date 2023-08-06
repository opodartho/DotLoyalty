# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'campaigns/new' do
  before do
    assign(:campaign, build(:campaign))
  end

  it 'renders new campaign form' do
    render

    assert_select 'form[action=?][method=?]', campaigns_path, 'post' do
      assert_select 'input[name=?]', 'campaign[name]'

      assert_select 'textarea[name=?]', 'campaign[description]'

      assert_select 'input[name=?]', 'campaign[campaign_type]'

      assert_select 'input[name=?]', 'campaign[trigger]'

      assert_select 'input[name=?]', 'campaign[active]'

      assert_select 'input[name=?]', 'campaign[order]'

      assert_select 'select[name=?]', 'campaign[store_id]'
    end
  end
end
