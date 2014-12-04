class AddKeywordColToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :seo_keyword, :string
  end
end
