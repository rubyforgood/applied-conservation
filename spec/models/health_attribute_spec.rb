require 'rails_helper'

RSpec.describe DefaultHealthAttribute, type: :model do
  it { should belong_to(:target_type) }
end
