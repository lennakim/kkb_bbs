class PostsController < ApplicationController
  def index
    if params[:node_id]
      @node = Node.where(id: params[:node_id])
      @posts = @node.posts.order("created_at DESC").page(params[:page]).per(24)
    elsif params[:level]
      @posts = Post.where(level: params[:level]).order("created_at DESC").page(params[:page]).per(24)
    else
      @posts = Post.all.order("level DESC", "created_at DESC").page(params[:page]).per(24)
    end
  end

  def new
    @post = Post.new
  end

  def create
    
  end
end
