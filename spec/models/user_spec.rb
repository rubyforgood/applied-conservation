require 'rails_helper'

describe User, type: :model do
  let!(:user) { create(:user) }

  it { should have_and_belong_to_many(:projects) }
end
