require 'rails_helper'

RSpec.describe Rating, type: :model do
  it { should belong_to(:project) }
  it { should belong_to(:rating_template) }
end
