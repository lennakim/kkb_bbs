class Admin::TopicsController < Admin::BaseController
  def index
    @admin_topics_grid = TopicsGrid.new(params[:topics_grid])
    @assets = @admin_topics_grid.assets.page(params[:page])
  end
end