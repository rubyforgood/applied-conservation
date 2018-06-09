class CreateHealthAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :health_attributes do |t|
      t.string :title
      t.string :description

    end
    add_foreign_key :health_attributes, :target_types
  end
end
