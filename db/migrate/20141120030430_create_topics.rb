class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.belongs_to :user, index: true
      t.belongs_to :node, index: true
      t.string   :title
      t.string   :permalink
      t.text     :body
      t.integer  :level
      t.integer  :views
      t.integer  :comments_count, default: 0
      t.integer  :last_comment_id

      t.timestamps
    end

    add_index :topics, :id, unique: true

  end
end