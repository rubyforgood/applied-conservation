# frozen_string_literal: true

class TargetType < ApplicationRecord
  belongs_to :target
  has_many :health_attributes
end
