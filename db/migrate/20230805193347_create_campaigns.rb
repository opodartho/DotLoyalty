# frozen_string_literal: true

class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.string :name, null: false
      t.text :description
      t.integer :campaign_type, null: false, default: 0
      t.integer :trigger, null: false, default: 0
      t.boolean :active, null: false, default: true
      t.datetime :active_from
      t.datetime :active_to
      t.integer :order, null: false
      t.belongs_to :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
