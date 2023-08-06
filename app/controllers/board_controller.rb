# frozen_string_literal: true

class BoardController < ApplicationController
  def show
    return if params[:board_name].blank?

    board = Board.find_by name: params[:board_name]

    respond_to do |format|
      @board = board
      format.html { render :show }
    end
  end

  def subject
    return if params[:board_name].blank?

    board = Board.find_by name: params[:board_name]
    render plain: board.ths.map { |th|
      "#{format('%010d', th.id)}.dat<>#{th.name} (#{th.comments.size})"
    } * "\n"
  end

  def head
    return if params[:board_name].blank?

    render plain: '<div>やわらか戦車</div>'
  end

  def bbsmenu
    @categories = BoardCategory.all
    render :bbsmenu
  end
end
