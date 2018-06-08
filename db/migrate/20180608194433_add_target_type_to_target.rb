class AddTargetTypeToTarget < ActiveRecord::Migration[5.2]
  def change
    remove_column :targets, :target_type
    add_column :targets, :target_type_id, :integer

    add_index :targets, :target_type_id
  end
end
