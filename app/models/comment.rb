class Comment < ActiveRecord::Base

  scope :recent, -> {order(created_at: :desc)}

  belongs_to :user, counter_cache: true, touch: true
  belongs_to :commentable, polymorphic: true, counter_cache: true, touch: true
  has_many   :notifications, as: :subjectable, dependent: :delete_all

  def find_commentable
    self.commentable_type.singularize.classify.constantize.find_by(id: self.commentable_id)
  end

  def comment_user
    find_commentable.try(:user)
  end

  def other_comment_users
    # 自己回复自己; 多次评论 都不会产生 Notification
    Comment.where.not(user_id: [user.id, comment_user.id]).where(commentable_id: commentable_id).map(&:user)
  end

  after_create :up_commentable, :remind_users

  private

  def remind_users
    #comment_user
    unless user == comment_user
      Notification.add_record(comment_user, self, 'topic')
      Rails.logger.info "user #{comment_user.id} add notification"
    end

    #other_comment_users
    other_comment_users.each do |other_user|
      Notification.add_record(other_user, self, 'comment')
      Rails.logger.info "user #{other_user.id} add notification"
    end

  end

  def up_commentable
    if commentable_type == "Topic"
      find_commentable.update(last_comment_id: id)
    end
  end
end
