require 'rails_helper'

RSpec.describe RatingTemplate, type: :model do
  it { should have_many(:ratings) }
end
