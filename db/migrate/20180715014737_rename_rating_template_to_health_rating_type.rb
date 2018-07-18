class RenameRatingTemplateToHealthRatingType < ActiveRecord::Migration[5.2]
  def change
    rename_table :rating_templates, :health_rating_types
  end
end