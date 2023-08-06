# frozen_string_literal: true

class CreateBoardCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :board_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
