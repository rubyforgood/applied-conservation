class AdjustHealthAssessments < ActiveRecord::Migration[5.2]
  def up
    add_column :health_assessments, :assessment_type, :string
    add_column :health_assessments, :locked, :boolean
    remove_column :health_assessments, :rating, :string
    remove_column :health_assessments, :name, :string
    remove_reference :health_assessments, :target, null: false, index: true, foreign_table_name: :users

    add_column :health_assessments, :created_at, :datetime, null: false
    add_column :health_assessments, :updated_at, :datetime, null: false

    add_reference :health_assessments, :health_rating, index: true, null: true, foreign_key: true
    add_reference :health_assessments, :health_attribute, index: true, null: false, foreign_key: true

    add_reference :health_assessments, :created_by, null: false, index: true, foreign_table_name: :users
    add_reference :health_assessments, :updated_by, null: false, index: true, foreign_table_name: :users
  end

  def down
    remove_column :health_assessments, :assessment_type, :string
    remove_column :health_assessments, :locked, :boolean
    add_column :health_assessments, :rating, :string
    add_column :health_assessments, :name, :string
    add_reference :health_assessments, :target, null: false, index: true, foreign_table_name: :users

    remove_column :health_assessments, :created_at, :datetime, null: false
    remove_column :health_assessments, :updated_at, :datetime, null: false

    remove_reference :health_assessments, :health_rating, index: true, null: true, foreign_key: true
    remove_reference :health_assessments, :health_attribute, index: true, null: false, foreign_key: true

    remove_reference :health_assessments, :created_by, null: false, index: true, foreign_table_name: :users
    remove_reference :health_assessments, :updated_by, null: false, index: true, foreign_table_name: :users
  end
end