require_relative './form_helpers'
require 'rails_helper'

feature 'Target management', js: true do
  let(:target_one_name) { 'TEST TARGET ONE' }
  let(:target_two_name) { 'TEST TARGET TWO' }
  let(:project) { create(:project) }
  let!(:terrestrial_target_type) { TargetType.create(name: 'Terrestrial Ecosystem') }

  before do
    sign_in(create(:user))
  end

  it 'User can view all targets for a Project' do
    Target.create(name: target_one_name, project: project)
    Target.create(name: target_two_name, project: project)
    Target.create(name: 'NOT MY TARGET', project: Project.create)

    visit "/projects/#{project.id}"
    click_link 'Capture Targets'

    expect(page).to have_text(project.name)
    expect(page).to have_text(target_one_name)
    expect(page).to have_text(target_two_name)
    expect(page).not_to have_text('NOT MY TARGET')
  end

  it 'User can create a new Target' do
    create(:default_health_attribute, name: 'Fire Regime', target_type: terrestrial_target_type)

    visit "/projects/#{project.id}/targets/new"

    # check for hints
    expect(page.find('.hints')).to have_content('Start with Ecosystem Targets')

    # fill out form
    fill_in('Name', with: 'NEW TARGET')
    select(terrestrial_target_type.name, from: 'target[target_type_id]')
    fill_in('Description', with: 'TARGET DESCRIPTION')
    click_button('Save')

    target = Target.last
    expect(current_path).to eq target_path(target)
    expect(page.find('.page-heading')).to have_text('NEW TARGET')

    expect(page.find('section.health-attributes')).to have_text('Fire Regime')
  end

  it 'User can edit a Target' do
    target = FactoryBot.create(:target, project: project)

    visit "/targets/#{target.id}"
    click_link 'Edit'

    expect(page).to have_content "Edit #{target.name}"

    fill_in('Name', with: 'EDITED TARGET NAME')
    select('Terrestrial Ecosystem', from: 'target[target_type_id]')
    fill_in('Description', with: 'TARGET DESCRIPTION')
    click_button('Save')

    expect(page).to have_text('EDITED TARGET NAME')
    expect(page).not_to have_text(target_one_name)
  end

  describe 'Editing health attributes' do
    let!(:target) { create(:target) }
    let!(:good_health_rating_type) { create(:health_rating_type, name: 'good') }
    let!(:default_health_attribute) { create(:default_health_attribute, target_type: target.target_type) }
    let!(:health_attribute) do
      create(:health_attribute,
             default_health_attribute: default_health_attribute,
             target: target)
    end
    let!(:default_health_rating) do
      create(:default_health_rating, default_health_attribute: default_health_attribute, health_rating_type: good_health_rating_type)
    end
    let!(:health_rating) do
      create(:health_rating,
             health_rating_type: good_health_rating_type,
             default_health_rating: default_health_rating)
    end
    let!(:health_assessment) { create(:health_assessment, health_attribute: health_attribute) }

    it 'User can edit health attribute from edit form' do
      visit "/targets/#{target.id}"
      click_link health_attribute.name
      expect(page.find('.page-heading')).to have_content health_attribute.name

      click_link 'Edit'
      expect(page.find('.page-heading')).to have_content "Edit #{health_attribute.name}"

      fill_in 'Name', with: 'New Name'
      click_button 'Save'
      expect(page.find('.page-heading')).to have_content target.name
    end

    it 'User can edit health attribute current assessment rating from target show page' do
      visit "/targets/#{target.id}"
      # select Good: description for good for health_attribute from current rating dropdown
      # refresh the page
      # expect
    end
  end
end
