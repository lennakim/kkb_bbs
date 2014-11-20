class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string  :uuid,   default: ""
      t.string  :name,   default: ""
      t.string  :email,  default: ""
      t.string  :form
      t.string  :avatar, default: ""
      t.integer :topics_count, default: 0
      t.integer :comments_count, default: 0
      t.datetime :confirmed_at

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
