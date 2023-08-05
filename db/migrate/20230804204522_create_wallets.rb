# frozen_string_literal: true

class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.belongs_to :store, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.boolean :active, null: false, default: true
      t.string :singular, null: false
      t.string :plural, null: false
      t.string :expire_unit_method, null: false

      t.timestamps
    end
  end
end
