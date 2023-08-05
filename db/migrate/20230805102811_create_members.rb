# frozen_string_literal: true

class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.string :gender, null: false
      t.bigint :phone, null: false
      t.date :birth_date
      t.belongs_to :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
