class SessionsController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart

  def new
  end

  def create # post login and password
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      if params[:requested_url]
        redirect_to params[:requested_url]
      else
        redirect_to store_path
      end
    else
      redirect_to login_url, alert: 'Invalid user or password'
    end
  end

  def destroy # logout
    session[:user_id] = nil
    redirect_to store_url, notice: 'Logged out'
  end
end