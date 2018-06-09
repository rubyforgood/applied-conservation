class CreateGradeTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :grade_templates do |t|
      t.string :name
      t.integer :score
      t.integer :weight
    end
  end
end
