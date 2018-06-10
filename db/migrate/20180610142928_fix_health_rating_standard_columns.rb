class FixHealthRatingStandardColumns < ActiveRecord::Migration[5.2]
  def up
    remove_column :health_rating_standards, :float
    remove_column :health_rating_standards, :weight
    add_column :health_rating_standards, :weight, :float, default: 0, null: false
  end
end
