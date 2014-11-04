class AddNodeIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :node_id, :integer
  end
end
