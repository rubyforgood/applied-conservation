require 'rails_helper'

RSpec.describe HealthAssessment, type: :model do
  it { should belong_to(:health_rating) }
  it { should belong_to(:health_attribute) }
end
