class AdjustHealthRatings < ActiveRecord::Migration[5.2]
  def change
    remove_column :health_ratings, :rating, :string
    remove_column :health_ratings, :value, :string
    remove_column :health_ratings, :weight, :float
    remove_column :health_ratings, :locked, :boolean
    remove_index :health_ratings, :target_id
    remove_column :health_ratings, :target_id, :integer

    add_reference :health_ratings, :default_health_rating, index: true, null: true, foreign_key: true
    add_reference :health_ratings, :health_attribute, index: true, null: true, foreign_key: true
    add_reference :health_ratings, :health_rating_type, index: true, null: true, foreign_key: true
    add_reference :health_ratings, :created_by, null: false, index: true, foreign_table_name: :users
    add_reference :health_ratings, :updated_by, null: false, index: true, foreign_table_name: :users
  end
end