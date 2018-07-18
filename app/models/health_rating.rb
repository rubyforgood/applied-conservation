# frozen_string_literal: true

class HealthRating < ApplicationRecord
  belongs_to :default_health_rating, optional: true
  belongs_to :health_rating_type
  belongs_to :health_attribute

  belongs_to :created_by, optional: false, class_name: "User", foreign_key: :created_by_id, inverse_of: :health_ratings_as_creator
  belongs_to :updated_by, optional: false, class_name: "User", foreign_key: :updated_by_id, inverse_of: :health_ratings_as_updater
end
