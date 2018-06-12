class Target < ApplicationRecord
  belongs_to :project
  belongs_to :target_type, optional: true
  has_many :target_health_attribute_ratings
end
