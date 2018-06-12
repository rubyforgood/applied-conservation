require 'rails_helper'

describe Target, type: :model do
  it { should belong_to(:project) }
end
