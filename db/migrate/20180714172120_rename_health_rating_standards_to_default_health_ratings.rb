class RenameHealthRatingStandardsToDefaultHealthRatings < ActiveRecord::Migration[5.2]
  def change
    rename_table :health_rating_standards, :default_health_ratings
  end
end
