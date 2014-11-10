class UsersController < ApplicationController

  def new
    store_location params[:return_to]
    redirect_to CASClient::Frameworks::Rails::Filter
  end

end
