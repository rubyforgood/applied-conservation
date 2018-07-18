class HealthAttribute < ApplicationRecord
  belongs_to :target
  belongs_to :default_health_attribute, optional: true
  belongs_to :created_by, optional: false, class_name: "User", foreign_key: :created_by_id, inverse_of: :health_attributes_as_creator
  belongs_to :updated_by, optional: false, class_name: "User", foreign_key: :updated_by_id, inverse_of: :health_attributes_as_updater
  has_many :health_assessments
end