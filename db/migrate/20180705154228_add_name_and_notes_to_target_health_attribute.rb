class AddNameAndNotesToTargetHealthAttribute < ActiveRecord::Migration[5.2]
  def change
    add_column :target_health_attribute_ratings, :name, :string
    add_column :target_health_attribute_ratings, :notes, :text
    remove_column :target_health_attribute_ratings, :health_attribute_id
  end
end
