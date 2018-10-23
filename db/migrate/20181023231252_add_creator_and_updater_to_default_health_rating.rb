class AddCreatorAndUpdaterToDefaultHealthRating < ActiveRecord::Migration[5.2]
  def change
    add_reference :default_health_ratings, :created_by, null: false, index: true, foreign_table_name: :users
    add_reference :default_health_ratings, :updated_by, null: false, index: true, foreign_table_name: :users
  end
end
