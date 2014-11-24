class TopicsGrid
  include Datagrid
  scope do
    Topic
  end


  column :id
  column :title
end