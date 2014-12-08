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

  def unset_admin(user)
    user.update(role: '') if self.s_admin?
  end

  def set_forbidden(user)
    user.update(is_forbid: true)
  end

  def unset_forbidden(user)
    user.update(is_forbid: false)
  end

  def set_lock(user)
    user.update(locked_at: Time.now)
  end

  def unset_lock(user)
    user.update(locked_at: nil)
  end

  def s_admin?
    self == User.super_admin
  end

  def admin?
    self.role == 'admin'
  end

  def normal? #是否正常
    unless (s_admin? || admin?)
      (!locked?) and (!forbidden?)
    else
      true
    end
  end

  def locked? #是否禁言
    unless (s_admin? || admin?)
      locked_at.present? and ((locked_at + User::LOCK_TIME) > Time.now)
    else
      false
    end
  end

  def forbidden? #是否拉黑
    unless (s_admin? || admin?)
      is_forbid
    else
      false
    end
  end

  def active? #是否激活
    confirmed.present?
  end
end