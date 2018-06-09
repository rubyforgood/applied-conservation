require 'rails_helper'

feature 'Project management' do
  scenario 'User visits projects index' do
    visit root_path
    expect(page).to have_content "Projects"
  end

  scenario 'User visits project show' do
    project = Project.create(name: 'River Test')

    visit project_path(project)
    expect(page).to have_content "Add New Task"
  end  

  scenario 'User can add a new Target' do
    visit root_path
    click_link 'New Project'

    fill_in('Name', with: 'NEW PROJECT')
    fill_in('Description', with: 'NEW PROJECT DESCRIPTION')
    click_button('Create Project')

    expect(page).to have_text('NEW PROJECT')
  end
end
