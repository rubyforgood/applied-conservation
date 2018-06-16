require 'rails_helper'
require_relative './form_helpers'

feature 'Target management', js: true do
  let(:project_name) { 'TEST PROJECT' }
  let(:target_one_name) { 'TEST TARGET ONE' }
  let(:target_two_name) { 'TEST TARGET TWO' }
  let(:project) { Project.create(name: project_name) }
  let!(:terrestrial_target_type) { TargetType.create(name: 'Terrestrial Ecosystem') }

  it 'User can view all targets for a Project' do
    Target.create(name: target_one_name, project: project)
    Target.create(name: target_two_name, project: project)
    Target.create(name: 'NOT MY TARGET', project: Project.create)

    visit "/projects/#{project.id}"
    click_link 'Capture Targets'

    expect(page).to have_text(project_name)
    expect(page).to have_text(target_one_name)
    expect(page).to have_text(target_two_name)
    expect(page).not_to have_text('NOT MY TARGET')
  end

  it 'User can create a new Target' do
    HealthAttribute.create(title: 'Ground Quality', target_type: terrestrial_target_type)

    visit "/projects/#{project.id}/targets/new"

    fill_in_autosuggest('Name', with: 'NEW TARGET')
    select('Terrestrial Ecosystem', from: 'target[target_type_id]')
    fill_in('Description', with: 'TARGET DESCRIPTION')
    click_button('Save')

    target = Target.last
    expect(current_path).to eq project_target_path(project, target)
    expect(page.find('.page-sub-heading')).to have_text('NEW TARGET')
    expect(page.find('section.health-attributes')).to have_text('Ground Quality')
  end

  it 'User can edit a Target' do
    target = FactoryBot.create(:target, project: project)

    visit "/projects/#{project.id}"
    click_link 'Capture Targets'
    click_link target.name

    expect(page).to have_content "Edit #{target.name}"

    fill_in_autosuggest('Name', with: 'EDITED TARGET NAME')
    select('Terrestrial Ecosystem', from: 'target[target_type_id]')
    fill_in('Description', with: 'TARGET DESCRIPTION')
    click_button('Save')

    expect(page).to have_text('EDITED TARGET NAME')
    expect(page).not_to have_text(target_one_name)
  end
end
