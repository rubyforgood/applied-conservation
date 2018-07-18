# frozen_string_literal: true

class DefaultHealthAttribute < ApplicationRecord
  belongs_to :target_type
  belongs_to :created_by, optional: false, class_name: "User", foreign_key: :created_by_id, inverse_of: :default_health_attributes_as_creator
  belongs_to :updated_by, optional: false, class_name: "User", foreign_key: :updated_by_id, inverse_of: :default_health_attributes_as_updater
  has_many :default_health_ratings
  has_many :health_attributes
end
