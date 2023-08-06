# frozen_string_literal: true

class BoardCategory < ApplicationRecord
  has_many :boards, dependent: :restrict_with_exception
end
