class Rating < ApplicationRecord
  belongs_to :project
  belongs_to :rating_template, optional: true
end
