require 'rails_helper'

RSpec.describe Target, type: :model do
  it { should belong_to(:project) }
end
