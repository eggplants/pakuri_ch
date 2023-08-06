# frozen_string_literal: true

class RenameDefaultCommentNameColumnToBoards < ActiveRecord::Migration[7.1]
  def change
    rename_column :boards, :default_comment_name, :default_from_name
  end
end
