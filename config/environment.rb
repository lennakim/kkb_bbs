require File.expand_path('../application', __FILE__)

Rails.application.initialize!

CASClient::Frameworks::Rails::Filter.configure(
  cas_base_url: Settings.cas_base_url
)