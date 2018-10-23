class AdjustDefaultHealthAttributes < ActiveRecord::Migration[5.2]
  def up
    rename_column :default_health_attributes, :title, :name

    add_column :default_health_attributes, :created_at, :datetime, null: false
    add_column :default_health_attributes, :updated_at, :datetime, null: false

    add_reference :default_health_attributes, :created_by, null: false, index: true, foreign_table_name: :users
    add_reference :default_health_attributes, :updated_by, null: false, index: true, foreign_table_name: :users
  end

  def down
    rename_column :default_health_attributes, :name, :title

    remove_column :default_health_attributes, :created_at, :datetime, null: false
    remove_column :default_health_attributes, :updated_at, :datetime, null: false

    remove_reference :default_health_attributes, :created_by, null: false, index: true, foreign_table_name: :users
    remove_reference :default_health_attributes, :updated_by, null: false, index: true, foreign_table_name: :users
  end
end