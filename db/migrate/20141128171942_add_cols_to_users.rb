class AddColsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :locked_at, :datetime
    add_column :users, :is_forbid, :boolean, default: false
  end
end
