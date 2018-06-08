class CreateTargets < ActiveRecord::Migration[5.2]
  def change
    create_table :targets do |t|
      t.string :type
      t.text :description
      t.string :name
      t.references :project, index: true, foreign_key: true

      t.timestamps
    end
  end
end
