class Admin::TopicsController < Admin::BaseController
  before_action :find_topic, only: [:show, :edit, :update, :add_to_recycle]
  def index
    @admin_topics_grid = TopicsGrid.new(params[:topics_grid])
    @assets = @admin_topics_grid.assets.page(params[:page])
  end

  def show
    if @topic.is_trashed == false
      @comments = @topic.comments  
    end
  end

  def recycle_topic
    @recycle_topic = RecycleTopicGrid.new(params[:recycle_topic_grid])
    @assets = @recycle_topic.assets.page(params[:page])
  end

  def add_to_recycle
    if @topic != nil
      @topic.update(:is_trashed => true)  
      @a = 0
    else
      @topic = Topic.with_trashed.find(params[:id])
      @topic.update(:is_trashed => false)  
      @a = 1
    end
    if @topic.save
      if @a == 0
        redirect_to admin_topics_path  
      else
        redirect_to admin_recycle_list_path
      end
    else
      if @a == 1
        redirect_to admin_topics_path  
      else
        redirect_to admin_recycle_list_path
      end
    end
  end

  private

  def find_topic
    @topic = Topic.find_by(id: params[:id])
  end

  def topic_params
    params.require(:topic).permit!
  end

end