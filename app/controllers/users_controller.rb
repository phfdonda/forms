class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  # require 'users_helper'
  # include UsersHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to new_user_path, notice: 'User account was successfully updated.' }
        format.json { render :new, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        flash.notice = "You can't use special characters with username. You need to provide a valid email"
      end
    end
  end

  def edit; end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
