class Grade < ApplicationRecord
  belongs_to :project
  belongs_to :grade_template
end
