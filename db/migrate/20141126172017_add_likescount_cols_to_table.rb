class AddLikescountColsToTable < ActiveRecord::Migration
  def change
    add_column :topics,   :like_counts, :integer, default: 0
    add_column :comments, :like_counts, :integer, default: 0
  end
end
