class Post < ActiveRecord::Base
  belongs_to :node

  scope :recent, -> {order(created_at: :desc)}
end
