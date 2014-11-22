class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @topics = @user.topics.recent.page(params[:page])
    @comments = @user.comments.recent.page(params[:page])
    @notifications = @user.notifications.recent.page(params[:page])
  end

  def me
    current_user
  end
end