class CreateHealthAttributes2 < ActiveRecord::Migration[5.2]
  def change
    create_table :health_attributes do |t|
      t.references :default_health_attribute, null: true,  index: true, foreign_key: true
      t.references :target,                    null: false, index: true, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps null: false

      t.references :created_by, null: false, index: true, foreign_table_name: :users
      t.references :updated_by, null: false, index: true, foreign_table_name: :users
    end
  end
end
