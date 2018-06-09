class CreateHealthAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :health_attributes do |t|
      t.string :title
      t.string :description

      t.references :target_type, foreign_key: true
    end
  end
end
