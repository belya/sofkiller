class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout 'yeti'

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, notice: t(:access_denied_notice)
  end

end
