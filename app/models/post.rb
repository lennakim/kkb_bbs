class Post < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  scope :recent, -> {order(created_at: :desc)}

  belongs_to :node
end
