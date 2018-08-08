# frozen_string_literal: true

class DefaultHealthRating < ApplicationRecord
  belongs_to :default_health_attribute
  belongs_to :health_rating_type
  belongs_to :created_by, optional: false, class_name: 'User', foreign_key: :created_by_id,
                          inverse_of: :default_health_ratings_as_creator
  belongs_to :updated_by, optional: false, class_name: 'User', foreign_key: :updated_by_id,
                          inverse_of: :default_health_ratings_as_updater
  has_many :health_ratings
end
