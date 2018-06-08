require 'rails_helper'

feature 'Projects' do
  scenario 'user visits projects index' do
    visit root_path
    expect(page).to have_content "Projects"
  end
  
  scenario 'user visits project show' do
    before do
      @project = create :project
    end  
    visit @project
    expect(page).to have_content "Add New Task"
  end  
end