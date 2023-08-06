# frozen_string_literal: true

class AddDefaultCommentNameToBoards < ActiveRecord::Migration[7.1]
  def change
    add_column :boards, :default_comment_name, :string
  end
end
