class AddColsToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :comments_count, :integer, default: 0
    add_column :posts, :last_comment_at, :datetime
  end

  def down
    remove_column :posts, :comments_count
    remove_column :posts, :last_comment_at
  end
end
