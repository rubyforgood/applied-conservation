# frozen_string_literal: true

class Target < ApplicationRecord
  belongs_to :project
  has_one :target_type
end
