class DefaultHealthRating < ApplicationRecord
  belongs_to :default_health_attribute
  belongs_to :health_rating_type
  has_many :health_ratings
end
