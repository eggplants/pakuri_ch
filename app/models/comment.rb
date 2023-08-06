# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :th

  after_create do
    comment = Comment.find id
    comment.hashed_id = calcurate_hash_from_ip ip: comment.ip, time: comment.created_at
    comment.length = comment.body.size
    comment.save!
  end

  private

  def calcurate_hash_from_ip(ip:, time:)
    # change hash salt by day
    return if ip.blank? || time.blank?

    hash_f = Hashids.new(time.strftime("%Y%m%d-#{Rails.application.secret_key_base}"), 8)
    hash_f.encode(ip.split('.').map(&:to_i))
  end
end
