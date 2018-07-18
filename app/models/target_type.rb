class TargetType < ApplicationRecord
  has_many :targets
  has_many :default_health_attributes
end
