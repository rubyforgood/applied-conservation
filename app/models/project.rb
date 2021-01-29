# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :targets, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_and_belongs_to_many :users, dependent: :destroy

  validates :name, presence: true
end
