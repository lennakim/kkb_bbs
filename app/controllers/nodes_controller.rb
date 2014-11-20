class NodesController < ApplicationController

  def index
    @nodes = Node.all
  end

  def show
    @node = Node.find_by(id: params[:id])
    @topics = @node.topics.page(params[:page])
  end
end