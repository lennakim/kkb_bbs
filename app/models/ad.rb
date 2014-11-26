# encoding:utf-8
require 'carrierwave/orm/activerecord'
class Ad < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  private
  def set_status
    self.status ||= "false"
  end
end
