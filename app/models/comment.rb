class Comment < ActiveRecord::Base

  scope :recent, -> {order(created_at: :desc)}

  belongs_to :user
  belongs_to :commentable, polymorphic: true, counter_cache: true, touch: true

  def find_commentable
    self.commentable_type.singularize.classify.constantize.find_by(id: self.commentable_id)
  end

  after_create :up_commentable

  private

  def up_commentable
    if commentable_type == "Topic"
      find_commentable.update(last_comment_id: id)
    end
  end
end
