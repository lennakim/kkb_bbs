class SessionsController < ApplicationController

  before_action CASClient::Frameworks::Rails::GatewayFilter, only: [:new, :create]

  def new
    redirect_to CASClient::Frameworks::Rails::Filter.login_url(self)
    store_location params[:return_to]
  end

  def create
    if session[:cas_user].present?
      render json: {msg: :ok}
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
