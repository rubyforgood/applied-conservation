class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.string :description
      t.references :grade_template, foreign_key: true
      t.references :project, foreign_key: true
    end
  end
end
