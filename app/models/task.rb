# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
end
