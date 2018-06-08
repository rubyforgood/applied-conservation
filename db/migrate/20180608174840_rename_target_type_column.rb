class RenameTargetTypeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :targets, :type, :target_type
  end
end
