class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :commentable, polymorphic: true, index: true
      t.text    :body
      t.integer :receiver_id #回复给谁
      t.integer :parent_comment_id

      t.timestamps
    end

    add_index :comments, :id, unique: true
  end
end
