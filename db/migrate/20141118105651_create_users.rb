class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :uuid,  null: false
      t.string :name,  null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :avatar, default: ""
      t.integer :topic_counts
      t.integer :comments_count
      t.string  :form

      t.datetime :confirmed_at

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
