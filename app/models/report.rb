class Report < ActiveRecord::Base
  scope :recent, -> {order(created_at: :desc)}

  def find_reportable
    self.reportable_type.singularize.classify.constantize.find_by(id: self.reportable_id)
  end
end
