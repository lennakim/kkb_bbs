class CommentsController < ApplicationController

  def index

  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def cmmment_params
    params.require(:comment).permit!
  end
end