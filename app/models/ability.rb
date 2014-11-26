class Ability
  include CanCan::Ability

  def initialize(user)
    account_modify_authority
    account_rw_authority

    @user = user
    @user ||= User.new
    user_can
  end

  def admin_can #超级管理员
    can :manage, :all
  end

  def user_can #一般用户
    can :search, Topic #search ability

    can :rw, Topic
    can :modify, Topic do |topic|
      topic.user == @user
    end

    can :rw, Comment
    can :modify, Comment do |comment|
      comment.user == @user
    end

    cannot :manage, Node
  end

  def guest_can
    cannot :manage, :all
  end

  def account_modify_authority
    alias_action :edit, :update, :destroy, :trash, to: :modify
  end

  def account_rw_authority
    alias_action :index, :show, :new, :create, to: :rw
  end
end
