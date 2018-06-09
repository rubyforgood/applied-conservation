require 'rails_helper'

feature 'Projects' do
  scenario 'user visits projects index' do
    visit root_path
    expect(page).to have_content "Projects"
  end

  before do
    @project = Project.create(name: 'River Test')
  end  

  scenario 'user visits project show' do
    visit project_path(@project)
    expect(page).to have_content "Add New Task"
  end  
end