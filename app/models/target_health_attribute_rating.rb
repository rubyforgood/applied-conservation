class TargetHealthAttributeRating < ApplicationRecord
  belongs_to :health_attribute
  belongs_to :target
end
