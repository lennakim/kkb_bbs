class CommentsController < ApplicationController
  load_and_authorize_resource

  before_action :login_required
  before_action :find_commentable

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @commentable
    else
      render :new
    end
  end

  def edit
    @comment = @commentable.comments.find(params[:id])
  end

  def update
    @comment = @commentable.comments.find(params[:id])

    if @comment.update_attributes(params[:comment])
      redirect_to @commentable
    else
      render :edit
    end
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy

    redirect_to @commentable
  end

  private

  def find_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def comment_params
    params.require(:comment).permit!
  end
end