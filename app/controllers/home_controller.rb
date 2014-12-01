class HomeController < ApplicationController

  def welcome
    @nodes = Node.list
    @title_list = @nodes.pluck(:title)

    @topics = Topic.recent.page(params[:page])
  end
end
