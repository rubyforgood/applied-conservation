class RenameGradesToRatings < ActiveRecord::Migration[5.2]
  def change
    rename_table :grade_templates, :rating_templates
    rename_table :grades, :ratings
    rename_column :ratings, :grade_template_id, :rating_template_id
  end
end
