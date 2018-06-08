class CreateTargetTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :target_types do |t|
      t.string :name, unique: true

      t.timestamps
    end
  end
end
