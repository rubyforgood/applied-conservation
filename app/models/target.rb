class Target < ApplicationRecord
  belongs_to :project
  belongs_to :target_type, optional: true
  has_many :health_assessments

  validates :name, presence: true
end
