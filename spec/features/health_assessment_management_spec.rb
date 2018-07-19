require 'rails_helper'

describe 'Health Assessment Management', js: true do
  let(:target) { create(:target) }

  before do
    login_any_user
  end

  describe 'Editing health_assessments' do
    let!(:health_assessment) { create(:health_assessment, target: target) }

    it 'User can use edit form' do
      visit "/targets/#{target.id}"
      click_link health_assessment.name
      expect(page.find('.page-heading')).to have_content health_assessment.name

      click_link "edit-health-assessment-#{health_assessment.id}"
      expect(page.find('.page-heading')).to have_content "Edit #{health_assessment.name}"

      fill_in 'Name', with: 'Edited Name'
      click_button 'Save'
      expect(page.find('.page-heading')).to have_content target.name
    end
  end

  it 'User can create a new health_assessment for a target' do
    visit "/targets/#{target.id}"
    click_link 'Add Health Assessment'

    fill_in 'Name', with: 'Testing'
    click_button 'Save'

    expect(page.find('.page-heading')).to have_content target.name
    expect(page.find('.index-table')).to have_content 'Testing'
  end

  it 'User can delete a health_assessment' do
    health_assessment = create(:health_assessment, target: target)

    visit "/targets/#{target.id}"
    click_link "delete-health-assessment-#{health_assessment.id}"

    expect(page.find('.page-heading')).to have_content target.name
    expect(page.find('.health-assessments')).to_not have_content health_assessment.name
  end
end
