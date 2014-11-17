class Node < ActiveRecord::Base
  validates :name, uniqueness: true, allow_nil: true

  has_many :posts

  scope :recent, -> {order(created_at: :desc)}
end
