class AddTrashedCol < ActiveRecord::Migration
  def change
    add_column :topics,   :is_trashed, :boolean, default: false
    add_column :comments, :is_trashed, :boolean, default: false
  end
end
