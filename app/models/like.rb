class Like < ActiveRecord::Base
  scope :recent, -> {order(created_at: :desc)}

  belongs_to :user
  belongs_to :likeable, polymorphic: true, counter_cache: true


  def find_likeable
    self.likeable_type.singularize.classify.constantize.find_by(id: self.likeable_id)
  end
end
