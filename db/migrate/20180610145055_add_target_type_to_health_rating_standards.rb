class AddTargetTypeToHealthRatingStandards < ActiveRecord::Migration[5.2]
  def change
    add_column :health_rating_standards, :target_type_id, :integer
  end
end
