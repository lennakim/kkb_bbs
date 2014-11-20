class User < ActiveRecord::Base
  has_many :topics
  has_many :comments

  def self.login_user(login)
    User.where('lower(email) = ? or lower(name) = ?', login, login).first
  end

  def admin?
    false
  end

  def active? #是否激活
    confirmed.present?
  end
end