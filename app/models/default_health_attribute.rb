class DefaultHealthAttribute < ApplicationRecord
  belongs_to :target_type
  has_many :default_health_ratings
  has_many :health_attributes
end
