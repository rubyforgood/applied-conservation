require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    project = Project.create(name: 'Mt Everest')
    @task = Task.create(name: 'Another Task', project_id: project.id)
  end  
  
  it { should belong_to(:project) }
  
  it 'is valid' do 
    expect(@task).to be_valid
  end  
end