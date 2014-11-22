class Notification < ActiveRecord::Base

  scope :recent, -> {order(created_at: :desc)}
  scope :unread, -> { where(read: false) }
  scope :had_read, -> { where(read: true) }

  belongs_to :user
  belongs_to :subjectable, polymorphic: true

  def self.add_record(user, subjectable, title)
    Notification.new(user: user, subjectable: subjectable, title: title).save
  end

  def set_read
    update(unread: true)
  end

  def find_subjectable
    self.subjectable_type.singularize.classify.constantize.find_by(id: self.subjectable_id)
  end
end