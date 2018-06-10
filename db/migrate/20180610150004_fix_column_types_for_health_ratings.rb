class FixColumnTypesForHealthRatings < ActiveRecord::Migration[5.2]
  def change
    remove_column :health_ratings, :float
    remove_column :health_ratings, :weight
    add_column :health_ratings, :weight, :float, default: 0, null: false
  end
end
