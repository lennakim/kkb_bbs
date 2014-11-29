class Admin::NodesController < Admin::BaseController
  before_action :find_node, only: [:show, :edit, :update, :destroy]
  def index
    @q = Node.search(params[:q])
    if params[:q] != nil
      @nodes = @q.result  
    else
      @nodes = Node.page(params[:page])
    end
  end

  def edit
    
  end

  def show
  end

  def new
    @node = Node.new    
  end

  def create
    @node = Node.create(node_params)
    if @node.save
      redirect_to admin_node_path(@node)
    else
      render "new"
    end
  end

  def destroy
    if @node.destroy
      redirect_to admin_nodes_path
    else
      redirect_to admin_nodes_path
    end
  end

  def update
    @node.update(node_params)
    if @node.save
      redirect_to admin_node_path(@node)
    else
      render "edit"
    end
  end

  private

  def find_node
    @node = Node.find(params[:id])
  end

  def node_params
    params.require(:node).permit!
  end
end
