# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :select_locale

  private

  def select_locale
    return unless I18n.available_locales.include?(cookies[:locale]&.to_sym)

    I18n.locale = cookies[:locale]
  end
end
