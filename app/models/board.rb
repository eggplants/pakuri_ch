# frozen_string_literal: true

class Board < ApplicationRecord
  has_many :ths, dependent: :destroy
  belongs_to :board_category
end
