class Comment < ActiveRecord::Base

  scope :recent, -> {order(created_at: :desc)}

  belongs_to :user
  belongs_to :commentable, polymorphic: true, counter_cache: true, touch: true

  def find_commentable
    self.commentable_type.singularize.classify.constantize.find_by(id: self.commentable_id)
  end
end
