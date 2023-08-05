# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'campaigns/edit' do
  let(:campaign) do
    create(:campaign)
  end

  before do
    assign(:campaign, campaign)
  end

  it 'renders the edit campaign form' do
    render

    assert_select 'form[action=?][method=?]', campaign_path(campaign), 'post' do
      assert_select 'input[name=?]', 'campaign[name]'

      assert_select 'textarea[name=?]', 'campaign[description]'

      assert_select 'input[name=?]', 'campaign[campaign_type]'

      assert_select 'input[name=?]', 'campaign[trigger]'

      assert_select 'input[name=?]', 'campaign[active]'

      assert_select 'input[name=?]', 'campaign[order]'

      assert_select 'input[name=?]', 'campaign[store_id]'
    end
  end
end
