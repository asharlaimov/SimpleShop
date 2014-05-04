class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize
  helper_method :admin_rights, :authorized

  protected
  def authorize
    unless authorized
      redirect_lo_login
    end
  end

  def authorized
    !User.find_by(id: session[:user_id]).blank?
  end

  def admin_rights
    user = User.find_by(id: session[:user_id])
    user && user.admin
  end

  def require_admin_rights
    unless admin_rights
      redirect_lo_login 'Please login with admin user'
    end
  end

  def redirect_lo_login(msg = 'Please login to view requested content')
    redirect_to login_url(:requested_url => request.fullpath), notice: msg
  end
end
