class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.belongs_to :subjectable, polymorphic: true, index: true
      t.boolean :read, default: false

      t.timestamps
    end

    add_index :notifications, :id, unique: true
  end
end