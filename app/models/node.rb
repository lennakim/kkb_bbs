class Node < ActiveRecord::Base
  validates :title, uniqueness: true, allow_nil: true
  has_many :topics

  scope :recent, -> {order(created_at: :desc)}
end
