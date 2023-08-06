# frozen_string_literal: true

class AddHashedIdToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :hashed_id, :string
  end
end
