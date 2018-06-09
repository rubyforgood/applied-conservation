class Target < ApplicationRecord
  belongs_to :project
  belongs_to :target_type, optional: true
end
