class CreateHealthRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :health_ratings do |t|
      t.string :rating
      t.string :description
      t.float :value
      t.string :weight
      t.string :float
      t.boolean :locked, default: false, null: false
      t.belongs_to :target

      t.timestamps
    end
  end
end
