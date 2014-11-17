class HomeController < ApplicationController
  def welcome
    @nodes = Node.all
    @posts = Post.all.order("level DESC, created_at DESC")
  end
end
