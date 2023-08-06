# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.integer :length
      t.references :th, null: false, foreign_key: true
      t.string :from_name
      t.string :mail
      t.string :body
      t.string :ip

      t.timestamps
    end
  end
end
