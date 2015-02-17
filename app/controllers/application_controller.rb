class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    return nil if session[:user_id].nil?
    User.find(session[:user_id])
  end

  def ensure_that_signed_in
    if current_user.nil?
      redirect_to signin_path, notice:'you should be signed in'
    else
      ensure_user_enabled
    end
  end

  def ensure_user_enabled
    if current_user.enabled?
      ensure_admin
    else
      redirect_to signin_path, alert:'your account is disabled, please contact the administrator.'
    end
  end

  def ensure_admin
    redirect_to signin_path, alert:'admin login required!' if not current_user.admin?
  end
end
