# frozen_string_literal: true

class Th < ApplicationRecord
  belongs_to :board
  has_many :comments, dependent: :destroy
end
