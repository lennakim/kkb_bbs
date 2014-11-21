class Node < ActiveRecord::Base
  validates :title, uniqueness: true, allow_nil: true
  has_many :topics, dependent: :destroy

  scope :list, -> {order(created_at: :asc)}
  scope :recent, -> {order(created_at: :desc)}
end
