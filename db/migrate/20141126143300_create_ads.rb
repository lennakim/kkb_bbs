class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :alise_title
      t.string :url
      t.string :title
      t.string :sub_title
      t.string :status
      t.string :ad_type

      t.timestamps
    end
  end
end
