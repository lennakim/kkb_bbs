class HomeController < ApplicationController

  def welcome
    @nodes = Node.list
    @title_list = @nodes.pluck(:title)
    @sliders = Ad.where(:ad_type => "carousel")
    @topics = Topic.order("level DESC, created_at DESC").page(params[:page])
  end
end
