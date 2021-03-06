class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "Welcome to CoderChat"
      redirect_to @user
    else 
      render 'new'
    end 
  end

  def show
  end

  def index
  end

  private 

  def user_params 
    params.require(:user).permit(:username, :password, :email)
  end 

end
