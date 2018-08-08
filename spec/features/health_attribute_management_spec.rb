require 'rails_helper'

describe 'Health Attribute Management', js: true do
  let(:target) { create(:target) }

  before do
    sign_in(create(:user))
  end

  describe 'Editing health_attributes' do
    let!(:health_attribute) { create(:health_attribute, target: target) }

    it 'User can use edit form' do
      visit "/targets/#{target.id}"
      click_link health_attribute.name
      expect(page.find('.page-heading')).to have_content health_attribute.name

      click_link "edit-health-attribute-#{health_attribute.id}"
      expect(page.find('.page-heading')).to have_content "Edit #{health_attribute.name}"

      fill_in 'Name', with: 'Edited Name'
      click_button 'Save'
      expect(page.find('.page-heading')).to have_content target.name
    end
  end

  it 'User can create a new health_attribute for a target' do
    visit "/targets/#{target.id}"
    click_link 'Add Health Attribute'

    fill_in 'Name', with: 'Testing'
    click_button 'Save'

    expect(page.find('.page-heading')).to have_content target.name
    expect(page.find('.index-table')).to have_content 'Testing'
  end

  it 'User can delete a health_attribute' do
    health_attribute = create(:health_attribute, target: target)

    visit "/targets/#{target.id}"
    click_link "delete-health-attribute-#{health_attribute.id}"

    expect(page.find('.page-heading')).to have_content target.name
    expect(page.find('.health-attributes')).to_not have_content health_attribute.name
  end
end
