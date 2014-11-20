class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer  :user_id
      t.integer  :node_id
      t.string   :title
      t.string   :permalink
      t.text     :body
      t.integer  :level
      t.integer  :views
      t.integer  :comments_count, default: 0
      t.integer  :last_comment_id

      t.timestamps
    end
  end
end