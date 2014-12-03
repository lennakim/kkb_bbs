class RecycleTopicGrid
  include Datagrid
  scope do
    Topic.with_trashed.includes(:user)
  end
  filter :id
  filter :title 
  filter :name do |value|
    where('users.username like ?', "%#{value}%")
  end
  filter :eamil do |value|
    where('users.email like ?', "%#{value}%")
  end

  column :eamil do |format|
    format.user.email
  end
  column :name do |format|
    format.user.name
  end

  column :id
  column :title


  column(:actions, :html => true) do |record|
    render partial: "actions", locals: { topic: record }
  end

end