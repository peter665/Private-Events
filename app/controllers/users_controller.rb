class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'You have successfuly signed up.'
      log_in @user
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end

end
