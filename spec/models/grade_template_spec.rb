require 'rails_helper'

RSpec.describe GradeTemplate, type: :model do
  it { should have_many(:grades) }
end
