# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :targets
  has_many :tasks
  has_and_belongs_to_many :users

  validates :name, presence: true
end
