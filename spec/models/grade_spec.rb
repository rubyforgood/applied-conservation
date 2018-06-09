require 'rails_helper'

RSpec.describe Grade, type: :model do
  it { should belong_to(:project) }
  it { should belong_to(:grade_template) }
end
