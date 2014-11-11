class SessionsController < ApplicationController

  # before_action CASClient::Frameworks::Rails::GatewayFilter, only: [:new, :create]
  before_action CASClient::Frameworks::Rails::Filter, only: [:new, :create]

  def new
    redirect_to CASClient::Frameworks::Rails::Filter.login_url(self)
    store_location params[:return_to]
  end

  def create
    if session[:cas_user].present?

      login = session[:cas_user].downcase

      @user = if login.include?('@')
                User.where('lower(email) = ?', login).first
              else
                User.where('lower(username) = ?', login).first
              end

      if @user.blank?
        @user = User.new
        @user.username = session[:cas_extra_attributes][:username]
        @user.email = session[:cas_extra_attributes][:email]
        @user.name = session[:cas_extra_attributes][:name] || session[:cas_extra_attributes][:username]
        if session[:cas_extra_attributes][:confirmed_at].present?
          @user.confirmed = true
        end
        @user.password = '123456'
        @user.save!
      end

      login_as @user
      remember_me
      redirect_back_or_default root_url

      # if @user && @user.authenticate(params[:password])
      #   login_as @user
      #   remember_me
      #   redirect_back_or_default root_url
      # else
      #   flash[:warning] = I18n.t('sessions.flashes.incorrect_user_name_or_password')
      #   redirect_to login_url
      # end
    else
      flash[:warning] = I18n.t('sessions.flashes.incorrect_user_name_or_password')
      # redirect_to login_url
      redirect_to root_url
    end
  end

  def destroy
    logout
    CASClient::Frameworks::Rails::Filter.logout(self)
    # redirect_to root_url
  end
end



