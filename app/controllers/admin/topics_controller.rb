class Admin::TopicsController < Admin::BaseController
  before_action :find_topic, only: [:show, :edit, :update, :add_to_recycle]
  def index
    @admin_topics_grid = TopicsGrid.new(params[:topics_grid])
    @assets = @admin_topics_grid.assets.page(params[:page])
  end

  def show
    @comments = @topic.comments
  end

  def add_to_recycle
    @topic.update(:is_trashed => true)
    if @topic.save
      redirect_to admin_topics_path
    else
      redirect_to admin_topics_path
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