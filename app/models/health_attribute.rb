# frozen_string_literal: true

class HealthAttribute < ApplicationRecord
  belongs_to :target_type
end
