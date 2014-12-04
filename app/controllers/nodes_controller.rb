class NodesController < ApplicationController
  load_and_authorize_resource

  def index
    @nodes = Node.list
  end

  def show
    @node = Node.find(params[:id])
    @topics = @node.topics.page(params[:page])
  end
end