class Topic < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  scope :recent, -> {order(created_at: :desc)}

  belongs_to :user, counter_cache: true, touch: true
  belongs_to :node, counter_cache: true, touch: true

  has_many :comments, as: :commentable, dependent: :destroy

  def first_comment
    comments.list.first
  end

  def second_comment
    comments.list.second
  end

  def last_comment
    Comment.find(last_comment_id)
  end
end
