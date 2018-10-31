class AdjustTargetTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :target_types, :description, :string
  end
end