require 'rails_helper'

feature 'Target Health Attributes', js: true do
  let!(:project) {  Project.create(name: 'Saving Bobs Lake from oil pollution', description: 'its a lake') }
  let(:target_type) { TargetType.create(name: 'Lake') }
  # let(:target) { Target.create(name: 'Bobs Lake', project: project, target_type: target_type) }

  before do
    HealthAttribute.create(title: 'Flows', target_type: target_type)
    HealthAttribute.create(title: 'Riparian Vegetation', target_type: target_type)
    HealthAttribute.create(title: 'Native Aquatic Animals', target_type: target_type)
    HealthAttribute.create(title: 'Physical Integrity',target_type: target_type)
    HealthAttribute.create(title: 'Water Quality', target_type: target_type)
  end

  describe 'Creating a Target' do

    it "shows it's health attributes" do
      visit "/projects/#{project.id}/targets/new"

      fill_in('Name', with: 'Bobs Lake')
      find('.Select-create-option-placeholder').click
      select('Lake', from: 'target[target_type_id]')

      click_button('Save')

      expect(page).to have_content("Bobs Lake")
      expect(page).to have_content('Health Attributes')

      # expect to see 5 health attributes
      expect(page).to have_content('Flows')
      expect(page).to have_content('Riparian Vegetation')
      expect(page).to have_content('Native Aquatic Animals')
      expect(page).to have_content('Physical Integrity')
      expect(page).to have_content('Water Quality')
    end
  end


end
