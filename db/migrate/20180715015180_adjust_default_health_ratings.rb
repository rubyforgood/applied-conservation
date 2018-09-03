class AdjustDefaultHealthRatings < ActiveRecord::Migration[5.2]
  def change
    remove_column :default_health_ratings, :rating, :string
    remove_column :default_health_ratings, :value, :string
    remove_column :default_health_ratings, :weight, :float
    remove_column :default_health_ratings, :locked, :boolean
    remove_column :default_health_ratings, :target_type_id, :integer

    add_column :default_health_ratings, :author_note, :string

    add_reference :default_health_ratings, :default_health_attribute, index: true, null: true, foreign_key: true
    add_reference :default_health_ratings, :health_rating_type, index: true, null: true, foreign_key: true
  end
end