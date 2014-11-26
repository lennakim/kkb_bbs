class User < ActiveRecord::Base
  has_many :topics, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_many :like_topics, through: :likes, source: :likeable, source_type: 'Topic'
  has_many :like_comments, through: :likes, source: :likeable, source_type: 'Comment'

  def self.login_user(login)
    User.where('lower(email) = ? or lower(name) = ?', login, login).first
  end

  def unread_notifications
    notifications.unread.recent
  end

  def read_notifications
    notifications.had_read.recent
  end

  def admin?
    false
  end

  def active? #是否激活
    confirmed.present?
  end

end