class CommentsController < ApplicationController
  before_filter :find_commentable
  def create
    @comment = @commentable.comments.new(cmmment_params)
    # @comment.user = current_user
    
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

  end

  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def find_commentable
    commentable_id = params.keys.select {|key| key =~ /([a-z]+)_id/}.first
    commentable_model = commentable_id.split('_')[0].camelcase.constantize # Post
    @commentable = commentable_model.find(params[commentable_id]) # Post.find(params['post_id'])
  end

  def cmmment_params
    params.require(:comment).permit!
  end
end