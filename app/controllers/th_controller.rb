# frozen_string_literal: true

class ThController < ApplicationController
  def show
    return if params[:board_name].blank? || params[:th_id].blank?

    board = Board.find_by name: params[:board_name]
    th = board.ths.find params[:th_id].to_i
    respond_to do |format|
      @board = board
      @thread = th
      format.html { render :show }
    end
  end

  def dat
    return if params[:board_name].blank? || params[:th_id].blank?

    board = Board.find_by name: params[:board_name]
    thread = Th.find_by(board_id: board, id: params[:th_id])
    render plain: thread.comments.map { |comment|
      [
        comment.name || board.default_from_name,
        comment.mail,
        "#{comment.created_at.strftime(t('thread.date', locale: :ja))} ID:#{comment.hashed_id}",
        comment.body,
        thread.name || ''
      ].join('<>')
    } * "\n"
  end
end
