class LikesController < ApplicationController
  before_action :login_required, :find_likeable

  def create
    @likeable.likes.find_or_create_by user: current_user

    if find_likeable.class.to_s == "Topic"
      redirect_to find_likeable
    else
      redirect_to find_likeable.find_commentable
    end
  end

  def destroy
    @likeable.likes.where(user: current_user).destroy_all

    if find_likeable.class.to_s == "Topic"
      redirect_to find_likeable
    else
      redirect_to find_likeable.find_commentable
    end
  end

  private

  def find_likeable
    resource, id = request.path.split('/')[1, 2]
    @likeable = resource.singularize.classify.constantize.find(id)
  end
end
