class AddCreatorAndUpdaterToDefaultHealthAttributes < ActiveRecord::Migration[5.2]
  def change
    add_reference :default_health_attributes, :updated_by, null: false, foreign_table_name: :users, index: true
    add_reference :default_health_attributes, :created_by, null: false, foreign_table_name: :users, index: true
  end
end
