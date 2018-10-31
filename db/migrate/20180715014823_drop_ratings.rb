class DropRatings < ActiveRecord::Migration[5.2]
  def change
    drop_table :ratings do |t|
      t.string :name
      t.string :description
      t.references :health_rating, null: false, index: true, foreign_key: true
      t.references :project, null: false, index: true, foreign_key: true
    end
  end
end
