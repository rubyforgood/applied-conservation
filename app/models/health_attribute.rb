class HealthAttribute < ApplicationRecord
  belongs_to :target
  belongs_to :default_health_attribute, optional: true
  belongs_to :created_by, optional: false, class_name: 'User',
                          foreign_key: :created_by_id, inverse_of: :health_attributes_as_creator
  belongs_to :updated_by, optional: false, class_name: 'User',
                          foreign_key: :updated_by_id, inverse_of: :health_attributes_as_updater
  has_many :health_assessments

  validates :name, presence: true

  def current_health_assessment
    health_assessments.where(assessment_type: 'current').last
  end

  def create_health_assessments
    health_assessments.create!(assessment_type: 'current',
                               created_by: created_by,
                               updated_by: updated_by)
    health_assessments.create!(assessment_type: 'projected future with NO action',
                               created_by: created_by,
                               updated_by: updated_by)
    health_assessments.create!(assessment_type: 'projected future with action',
                               created_by: created_by,
                               updated_by: updated_by)
  end
end
