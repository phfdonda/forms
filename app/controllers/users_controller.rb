class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create 
    @user = User.new(user_params)
    flash.notice = 'User account was created successfully!'
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
