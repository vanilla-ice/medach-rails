class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_admin_locale
    I18n.locale = :ru
  end

  def index
  end
end
