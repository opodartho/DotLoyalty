# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.belongs_to :member, null: false, foreign_key: true
      t.belongs_to :wallet, null: false, foreign_key: true
      t.integer :amount, null: false
      t.integer :action, null: false
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
