require 'rails_helper'

describe Project, type: :model do
  let!(:project) { create(:project) }

  it { should have_many(:targets) }
  it { expect(project).to validate_presence_of :name }
end
