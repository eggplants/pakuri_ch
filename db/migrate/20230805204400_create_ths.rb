# frozen_string_literal: true

class CreateThs < ActiveRecord::Migration[7.1]
  def change
    create_table :ths do |t|
      t.string :name
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
