require 'rails_helper'

RSpec.describe TargetHealthAttributeRating, type: :model do
  it { should belong_to(:health_attribute) }
  it { should belong_to(:target) }
end
