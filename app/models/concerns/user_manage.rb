module UserManage
  extend ActiveSupport::Concern

  included do
    def self.super_admin
      User.find_by(email: Settings.super_admin)
    end
  end

  def set_admin(user)
    user.update(role: 'admin') if self.s_admin?
  end

  def unset_admin
    user.update(role: '') if self.s_admin?
  end

  def set_forbidden(user)
    user.update(is_forbid: true)
  end

  def unset_forbidden(user)
    user.update(is_forbid: false)
  end

  def set_lock(user)
    user.update(locked_at: Time.mow)
  end

  def unset_lock(user)
    user.update(locked_at: nil)
  end

  def s_admin?
    self == User.super_admin
  end

  def admin?
    role == 'admin'
  end

  def normal? #是否正常
    (!locked?) and (!forbidden?)
  end

  def locked? #是否禁言
    locked_at.present? and ((locked_at + LOCK_TIME) < Time.now)
  end

  def forbidden? #是否拉黑
    is_forbid
  end

  def active? #是否激活
    confirmed.present?
  end
end