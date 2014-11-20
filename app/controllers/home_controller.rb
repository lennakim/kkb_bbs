class HomeController < ApplicationController

  def welcome
    @nodes = Node.all
    @topics = Topic.order("level DESC, created_at DESC").limit(10)
  end
end
