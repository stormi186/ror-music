class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    # @user = User.where(username: params[:username]).first

    if user && user.authenticate(params[:session][:password])
      flash[:notice] = 'Logged in successfully!'
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_path
    else
      flash[:error] = 'Incorrect username or password!'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
