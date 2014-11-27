class Comment < ActiveRecord::Base
  include Trashable
  include Likeable
  scope :recent, -> {order(created_at: :desc)}
  scope :list, -> {order(created_at: :asc)}

  belongs_to :user, counter_cache: true, touch: true
  belongs_to :commentable, polymorphic: true, counter_cache: true, touch: true
  has_many   :notifications, as: :subjectable, dependent: :delete_all

  after_trash   :decrement_counter_cache, :delete_all_notifications
  after_restore :increment_counter_cache
  after_destroy :increment_counter_cache, if: :trashed?

  def increment_counter_cache
    if commentable.has_attribute? :comments_count
      commentable.class.update_counters commentable.id, comments_count: 1
    end

    User.update_counters user.id, comments_count: 1
  end

  def decrement_counter_cache
    if commentable.has_attribute? :comments_count
      commentable.class.update_counters commentable.id, comments_count: -1
    end

    User.update_counters user.id, comments_count: -1
  end

  def delete_all_notifications
    notifications.delete_all
  end

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
