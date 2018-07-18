require 'rails_helper'

feature 'Project management' do
  let!(:project) { create(:project) }

  it 'User can view all projects and project details' do
    visit root_path

    expect(page).to have_content 'Projects'

    click_link project.name
    expect(page.find('.project-heading')).to have_content project.name
  end

  it 'User can edit a project' do
    visit project_path(project)
    click_link "edit-project-#{project.id}"

    fill_in 'Name', with: 'New Project Name!'
    click_button 'Save'

    expect(page.find('.project-heading')).to have_content 'New Project Name!'
  end

  it 'User can add a new Project' do
    visit root_path
    click_link 'New Project'

    fill_in('Name', with: 'NEW PROJECT')
    fill_in('Description', with: 'NEW PROJECT DESCRIPTION')
    click_button('Save')

    expect(page).to have_text('NEW PROJECT')
  end
end
