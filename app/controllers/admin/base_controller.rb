class Admin::BaseController < ActionController::Base
  layout 'admin'

  #protect_from_forgery with: :execption
end