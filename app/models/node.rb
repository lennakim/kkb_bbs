class Node < ActiveRecord::Base
  has_many :posts

  scope :recent, -> {order(created_at: :desc)}
end
