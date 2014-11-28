class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :reporter_id
      t.integer :bad_man_id
      t.belongs_to :reportable, polymorphic: true, index: true
      t.text  :body,   default: ""

      t.timestamps
    end
  end
end
