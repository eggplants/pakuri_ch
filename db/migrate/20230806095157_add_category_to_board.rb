# frozen_string_literal: true

class AddCategoryToBoard < ActiveRecord::Migration[7.1]
  def change
    add_reference :boards, :board_category, null: false, foreign_key: true
  end
end
