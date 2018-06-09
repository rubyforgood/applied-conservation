require 'rails_helper'

RSpec.describe HealthAttribute, type: :model do
  it { should belong_to(:target_type) }
end
