class PostsController < ApplicationController

  def index
    if params[:node_id]
      @node = Node.where(id: params[:node_id])
      @posts = @node.posts.recent.page(params[:page])
    elsif params[:level]
      @posts = Post.where(level: params[:level]).recent.page(params[:page])
    else
      @posts = Post.order("level DESC", "created_at DESC").page(params[:page])
    end
  end

  def new
    @post = Post.new
  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  def search
    @posts = Post.search(
      query: {
        multi_match: {
          query: params[:q].to_s,
          filter: ['title', 'content']
        }
      }
    )
  end

  private

  def find_post
    @post = Post.find_by(id: params[:id])
  end
end
