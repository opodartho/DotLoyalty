# frozen_string_literal: true

class CreateConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :conditions do |t|
      t.string :feature, null: false
      t.string :operators, null: false
      t.string :values, null: false
      t.integer :order, null: false, default: 0
      t.belongs_to :rule, null: false, foreign_key: true
      t.belongs_to :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
