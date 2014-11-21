class Notification < ActiveRecord::Base

  belongs_to :user
  belongs_to :subjectable, polymorphic: true
  scope :unread, -> { where(read: false) }

end