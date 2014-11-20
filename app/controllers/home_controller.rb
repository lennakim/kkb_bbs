class HomeController < ApplicationController

  def welcome
    @nodes = Node.list
    @topics = Topic.order("level DESC, created_at DESC").page(params[:page])
  end
end
