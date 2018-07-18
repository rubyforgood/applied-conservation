# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :project
  has_many :tasks
  has_many :default_health_attributes_as_creator, inverse_of: :created_by, class_name: "DefaultHealthAttribute", foreign_key: :created_by_id, dependent: :restrict_with_error
  has_many :default_health_attributes_as_updater, inverse_of: :created_by, class_name: "DefaultHealthAttribute", foreign_key: :updated_by_id, dependent: :restrict_with_error
  has_many :health_assessments_as_creator,        inverse_of: :created_by, class_name: "HealthAssessment", foreign_key: :created_by_id, dependent: :restrict_with_error
  has_many :health_assessments_as_updater,        inverse_of: :created_by, class_name: "HealthAssessment", foreign_key: :updated_by_id, dependent: :restrict_with_error
  has_many :health_attributes_as_creator,         inverse_of: :created_by, class_name: "HealthAttribute", foreign_key: :created_by_id, dependent: :restrict_with_error
  has_many :health_attributes_as_updater,         inverse_of: :created_by, class_name: "HealthAttribute", foreign_key: :updated_by_id, dependent: :restrict_with_error
  has_many :health_rating_types_as_creator,       inverse_of: :created_by, class_name: "HealthRatingType", foreign_key: :created_by_id, dependent: :restrict_with_error
  has_many :health_rating_types_as_updater,       inverse_of: :created_by, class_name: "HealthRatingType", foreign_key: :updated_by_id, dependent: :restrict_with_error

end
