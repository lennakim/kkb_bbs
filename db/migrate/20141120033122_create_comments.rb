class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :commentable_id
      t.text    :body
      t.string  :commentable_type
      t.integer :receiver_id #回复给谁
      t.integer :parent_comment_id

      t.timestamps
    end
  end
end
