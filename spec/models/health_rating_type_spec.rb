require 'rails_helper'

RSpec.describe HealthRatingType, type: :model do
  it { should have_many(:health_ratings) }
end
