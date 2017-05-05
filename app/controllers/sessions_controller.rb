class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      log_in(@user)
      flash[:success] = "You are logged in."
      redirect_to user_path(@user)
    else
      flash.now[:danger] = 'Invalid name!'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "You are now logged out."
    redirect_to root_path
  end

end
