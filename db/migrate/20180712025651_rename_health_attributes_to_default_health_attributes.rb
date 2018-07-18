class RenameHealthAttributesToDefaultHealthAttributes < ActiveRecord::Migration[5.2]
  def change
    rename_table :health_attributes, :default_health_attributes
  end
end
