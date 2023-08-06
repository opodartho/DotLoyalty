# frozen_string_literal: true

class CreateRules < ActiveRecord::Migration[7.0]
  def change
    create_table :rules do |t|
      t.integer :order, null: false
      t.belongs_to :store, null: false, foreign_key: true
      t.belongs_to :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
