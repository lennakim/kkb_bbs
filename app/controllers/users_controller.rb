class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def me
    current_user
  end
end