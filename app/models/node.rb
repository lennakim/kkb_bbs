class Node < ActiveRecord::Base
  validates :title, uniqueness: true, allow_nil: true
  has_many :topics, dependent: :destroy

  scope :list, -> {order(created_at: :asc)}
  scope :recent, -> {order(created_at: :desc)}

  def self.resource_node
    if node = Node.find_by(title: '资源分享')
      node.topics.recent.limit(5)
    end
  end

end
