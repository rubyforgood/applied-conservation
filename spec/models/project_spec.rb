require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should have_many(:targets) }
end
