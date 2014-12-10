class SessionsController < ApplicationController

  before_action CASClient::Frameworks::Rails::GatewayFilter, only: [:new, :create]

  def new
    redirect_to CASClient::Frameworks::Rails::Filter.login_url(self)
    store_location params[:return_to]
  end

  def create

    if session[:cas_user].present?
      login = session[:cas_user].downcase
      @user = User.login_user login

      if @user.blank?
        @user = User.new
        @user.id = session[:cas_extra_attributes]['id']
        @user.uuid = session[:cas_extra_attributes]['uuid']
        @user.email = session[:cas_extra_attributes]['email']
        @user.name = session[:cas_extra_attributes]['name'] || session[:cas_extra_attributes]['username']
        @user.confirmed_at = session[:cas_extra_attributes]['confirmed_at']
      end

      @user.save!
      login_as @user
      redirect_to root_url
    else
      redirect_to CASClient::Frameworks::Rails::Filter.login_url(self)
    end
  end

  def destroy
    logout
    CASClient::Frameworks::Rails::Filter.logout(self)
    # redirect_to root_url
  end
end
