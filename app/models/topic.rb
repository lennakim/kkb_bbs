class Topic < ActiveRecord::Base
  include Trashable
  include Likeable
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  scope :recent, -> {order(created_at: :desc)}
  scope :hot, -> {where("topics.comments_count >= ?", 50 )}
  scope :timeliness, -> {where(created_at: 1.month.ago..Time.now)} #时效性

  belongs_to :user, counter_cache: true, touch: true
  belongs_to :node, counter_cache: true, touch: true

  has_many :comments, as: :commentable, dependent: :destroy

  after_trash   :decrement_counter_cache
  after_restore :increment_counter_cache
  after_destroy :increment_counter_cache, if: :trashed?

  class << self
    def excellent #精华帖

    end
  end

  def increment_counter_cache
    if node.has_attribute? :topics_count
      node.class.update_counters node.id, topics_count: 1
    end
  end

  def decrement_counter_cache
    if node.has_attribute? :topics_count
      node.class.update_counters node.id, topics_count: -1
    end
  end

  def first_comment
    comments.list.first
  end

  def second_comment
    comments.list.second
  end

  def third_comment
    comments.list.third
  end

  def last_comment
    Comment.find(last_comment_id)
  end

  private

  def self.search_with_es(*args)
    __elasticsearch__.search(*args)
  end
end
