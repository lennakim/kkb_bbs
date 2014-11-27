class AddLikescountColsToTable < ActiveRecord::Migration
  def change
    add_column :topics,   :likes_count, :integer, default: 0
    add_column :comments, :likes_count, :integer, default: 0
  end
end
