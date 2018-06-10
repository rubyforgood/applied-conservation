class CreateTargetHealthAttributeRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :target_health_attribute_ratings do |t|
      t.string :rating, foreign_key: true, null: true
      t.references :target, foreign_key: true
      t.references :health_attribute, foreign_key: true
    end
  end
end
