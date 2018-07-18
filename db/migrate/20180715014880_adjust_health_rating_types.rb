class AdjustHealthRatingTypes < ActiveRecord::Migration[5.2]
  def up
    change_column :health_rating_types, :score, :float
    change_column :health_rating_types, :weight, :float
    add_column :health_rating_types, :threshold_min, :float
    add_column :health_rating_types, :threshold_max, :float

    add_column :health_rating_types, :created_at, :datetime, null: false
    add_column :health_rating_types, :updated_at, :datetime, null: false

    add_reference :health_rating_types, :created_by, null: false, index: true, foreign_table_name: :users
    add_reference :health_rating_types, :updated_by, null: false, index: true, foreign_table_name: :users
  end

  def down
    change_column :health_rating_types, :score, :bigint
    change_column :health_rating_types, :weight, :bigint
    remove_column :health_rating_types, :threshold_min, :float
    remove_column :health_rating_types, :threshold_max, :float

    remove_column :health_rating_types, :created_at, :datetime, null: false
    remove_column :health_rating_types, :updated_at, :datetime, null: false

    remove_reference :health_rating_types, :created_by, null: false, index: true, foreign_table_name: :users
    remove_reference :health_rating_types, :updated_by, null: false, index: true, foreign_table_name: :users
  end
end