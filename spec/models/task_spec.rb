require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task){build(:task)}
  
  it { should belong_to(:project) }
  
  it 'is valid' do 
    expect(task).to be_valid
  end  
end