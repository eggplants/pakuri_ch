# frozen_string_literal: true

class LocaleController < ApplicationController
  def show
    render plain: cookies[:locale] and return if I18n.available_locales.include?(cookies[:locale].to_sym)

    render plain: I18n.default_locale.to_s
  end

  def update
    cookies[:locale] = params[:locale] if I18n.available_locales.include?(params[:locale].to_sym)
    redirect_back fallback_location: root_path
  end
end
