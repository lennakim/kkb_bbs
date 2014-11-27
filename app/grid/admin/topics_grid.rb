class TopicsGrid
  include Datagrid
  scope do
    Topic
  end
  filter :id
  filter :title

  column :id
  column :title

  column(:actions, :html => true) do |record|
    render partial: "actions", locals: { topic: record }
  end

end