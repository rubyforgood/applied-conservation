# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :targets
  has_many :tasks

  validates :name, presence: true
end
