class PostsController < ApplicationController
  def index
    @post = Post.all.page(params[:page]).per(params[:per_num])
    
  end
end
