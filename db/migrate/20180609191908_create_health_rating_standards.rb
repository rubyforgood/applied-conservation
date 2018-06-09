class CreateHealthRatingStandards < ActiveRecord::Migration[5.2]
  def change
    create_table :health_rating_standards do |t|
      t.string :rating
      t.string :description
      t.float :value
      t.string :weight
      t.string :float
      t.boolean :locked, default: false, null: false
    end
  end
end
