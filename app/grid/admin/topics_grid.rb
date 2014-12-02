class TopicsGrid
  include Datagrid
  scope do
    Topic.includes(:user).merge(Topic.joins(:user))
  end
  filter :id
  filter :title 
  filter :name do |value|
    where('users.username like ?', "%#{value}%")
  end
  filter :eamil do |value|
    where('users.email like ?', "%#{value}%")
  end

  column :id
  column :title

  column(:actions, :html => true) do |record|
    render partial: "actions", locals: { topic: record }
  end

end