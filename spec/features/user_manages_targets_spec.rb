require 'rails_helper'

feature 'Target management', js: true do
  before do
    @project_name    = 'TEST PROJECT'
    @target_one_name = 'TEST TARGET ONE'
    @target_two_name = 'TEST TARGET TWO'

    @project = Project.create(name: @project_name)
    Target.create(name: @target_one_name, project: @project)
    Target.create(name: @target_two_name, project: @project)
    Target.create(name: 'NOT MY TARGET', project: Project.create)
    TargetType.create(name: 'Terrestrial Ecosystem')
  end

  scenario 'User can view all targets for a Project' do
    visit "/projects/#{@project.id}"
    click_link 'Capture Targets'

    expect(page).to have_text(@project_name)
    expect(page).to have_text(@target_one_name)
    expect(page).to have_text(@target_two_name)
    expect(page).not_to have_text('NOT MY TARGET')
  end

  scenario 'User can add a new Target' do
    visit "/projects/#{@project.id}"
    click_link 'Capture Targets'
    click_link 'Add target'

    # make sure autocomplete works
    find('.Select-control').click
    expect(page).to have_content('Forest')

    # TODO: pull put into helper select from autosuggest
    fill_in('Name', with: 'NEW TARGET')
    find('.Select-create-option-placeholder').click
    select('Terrestrial Ecosystem', from: 'target[target_type_id]')
    fill_in('Description', with: 'TARGET DESCRIPTION')
    click_button('Save')

    expect(page).to have_text('NEW TARGET')
    expect(current_path).to eq "/projects/#{@project.id}/targets"
  end

  scenario 'User can edit a Target' do
    visit "/projects/#{@project.id}"
    click_link 'Capture Targets'
    click_link @target_one_name

    fill_in('Name', with: 'EDITED TARGET NAME')
    find('.Select-create-option-placeholder').click
    select('Terrestrial Ecosystem', from: 'target[target_type_id]')
    fill_in('Description', with: 'TARGET DESCRIPTION')
    click_button('Save')

    expect(page).to have_text('EDITED TARGET NAME')
    expect(page).not_to have_text(@target_one_name)
  end
end