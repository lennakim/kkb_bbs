class PostsController < ApplicationController
  before_action :all_nodes
  before_action :set_post, except: [:index, :new, :create, :search]
# 未添加权限
  def index
    @nodes = Node.all
    if params[:node_id]
      @node = Node.where(id: params[:node_id]).first
      @posts = @node.posts.recent.page(params[:page])
    elsif params[:level]
      @posts = Post.where(level: params[:level]).recent.page(params[:page])
    else
      @posts = Post.order("level DESC", "created_at DESC").page(params[:page])
    end
  end

  def new
    # 登录才能发表
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html {
        @comments = @post.comments.order('created_at DESC').page(params[:page]).per(20)
      }

      format.json { render json: @post }
    end
  end

  def edit
    # 只能自己修改

  end

  def update
    @post.update(post_params)

    if @post.save

    else

    end
  end

  def destroy
    if @post.destroy

    else

    end
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

  def set_post
    @post = Post.find_by(id: params[:id])
  end
  def all_nodes
    @nodes = Node.all
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
