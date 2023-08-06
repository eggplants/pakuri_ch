# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    respond_to do |format|
      @board_categories = BoardCategory.all
      format.html
    end
  end
end
