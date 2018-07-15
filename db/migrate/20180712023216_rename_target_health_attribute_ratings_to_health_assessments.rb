class RenameTargetHealthAttributeRatingsToHealthAssessments < ActiveRecord::Migration[5.2]
  def change
    rename_table :target_health_attribute_ratings, :health_assessments
  end
end
