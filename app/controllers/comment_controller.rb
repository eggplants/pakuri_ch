# frozen_string_literal: true

class CommentController < ApplicationController
  def create
    if (params = validate_create_params).blank?
      redirect_back(
        notice: t('thread.error.create'), fallback_location: root_path
      ) and return
    end

    board = Board.find_by name: params[:board_name]
    if params[:thread_id].present? && params[:thread_name].blank?
      thread = create_comment(board:, params:)
    elsif params[:thread_id].blank? && params[:thread_name].present?
      thread = create_thread(board:, params:)
    end
    redirect_to "/#{params[:board_name]}/#{thread.id}"
  end

  private

  def validate_create_params
    return if params[:time].blank? || params[:submit].blank?

    return if (board_name = params[:bbs]).blank? ||
              (comment_body = params[:MESSAGE]).blank?

    return if (thread_id = params[:key]).blank? && (thread_name = params[:subject]).blank?

    return if thread_id.present? && thread_name.present?

    return if comment_body.empty?

    {
      board_name:,
      comment_from_name: params[:FROM],
      comment_mail: (m = params[:mail]).blank? ? nil : m,
      comment_body:,
      thread_id:,
      thread_name: (t = thread_name).blank? ? nil : t
    }
  end

  def create_thread(board:, params:)
    thread = board.ths.create!(name: params[:thread_name])
    thread.comments.create!(
      from_name: params[:comment_from_name],
      mail: params[:comment_mail],
      body: params[:comment_body],
      ip: request.remote_ip
    )
    thread
  end

  def create_comment(board:, params:)
    thread = board.ths.find params[:thread_id]
    thread.comments.create!(
      from_name: params[:comment_from_name],
      mail: params[:comment_mail],
      body: params[:comment_body],
      ip: request.remote_ip
    )
    thread
  end
end
