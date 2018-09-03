class AdjustDefaultHealthAttributes < ActiveRecord::Migration[5.2]
  def change
    rename_column :default_health_attributes, :title, :name
  end
end