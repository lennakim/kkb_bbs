class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :login?, :current_user, :no_locked_required

  if Rails.env.production?
    http_basic_authenticate_with name: "kkb_bbs", password: "secret"
  end

  def current_user
    @current_user ||= login_from_session
    @current_user
  end

  def login?
    !!current_user
  end

  def login_as(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def login_from_session
    if session[:user_id].present?
      begin
        User.find session[:user_id]
      rescue
        session[:user_id] = nil
      end
    end
  end

  def login_required
    unless login?
      redirect_to login_path(return_to: (request.fullpath if request.get?))
    end
  end

  def no_locked_required
    current_user.normal?
  end

  def store_location(path)
    session[:return_to] = path
  end

  ### rescue_from

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  ####

  def not_found
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end
end
