# frozen_string_literal: true

class TargetType < ApplicationRecord
  has_many :health_attributes
end
