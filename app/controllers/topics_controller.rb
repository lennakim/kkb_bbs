class TopicsController < ApplicationController
  before_action :all_nodes
  before_action :set_topic, except: [:index, :new, :create, :search]

# 未添加权限
  def index
    if params[:node_id]
      @node = Node.where(id: params[:node_id]).first
      @topics = @node.topics.recent.page(params[:page])
    elsif params[:level]
      @topics = Topic.where(level: params[:level]).recent.page(params[:page])
    else
      @topics = Topic.order("level DESC", "created_at DESC").page(params[:page])
    end
  end

  def new
    # 登录才能发表
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user

    respond_to do |format|
      if @topic.save
        format.html { redirect_to topics_path }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def show
    @topic = Topic.find(params[:id])

    respond_to do |format|
      format.html {
        @comments = @topic.comments.order('created_at DESC').page(params[:page])
      }
    end
  end

  def edit
    # 只能自己修改

  end

  def update
    @topic.update(topic_params)

    if @topic.save

    else

    end
  end

  def destroy
    if @topic.destroy

    else

    end
  end

  def search

    @topics = Topic.search(
      query: {
        multi_match: {
          query: params[:q].to_s,
          fields: ['title', 'body']
        }
      }
    ).records
  end

  private

  def all_nodes
    @nodes = Node.all
  end

  def set_topic
    @topic = Topic.find_by(id: params[:id])
  end

  def topic_params
    params.require(:topic).permit!
  end
end
