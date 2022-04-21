# frozen_string_literal: true

class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }, index: true
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
