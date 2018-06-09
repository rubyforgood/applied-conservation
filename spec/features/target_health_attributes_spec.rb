require 'rails_helper'

feature 'Target Health Attributes' do
  let!(:project) {  Project.create(name: 'Saving Bobs Lake from oil pollution', description: 'its a lake') }
  let(:target_type) { TargetType.create(name: 'Lake') }
  let(:target) { Target.create(name: 'Bobs Lake', project: project, target_type: target_type) }

  before do
    HealthAttribute.create(title: 'Flows', target_type: target_type)
    HealthAttribute.create(title: 'Riparian Vegetation', target_type: target_type)
    HealthAttribute.create(title: 'Native Aquatic Animals', target_type: target_type)
    HealthAttribute.create(title: 'Physical Integrity',target_type: target_type)
    HealthAttribute.create(title: 'Water Quality', target_type: target_type)
  end

  scenario 'User can view target health attributes' do
    visit project_target_path(project, target)

    expect(page).to have_content('Health Attributes')

    # expect to see 5 health attributes
    expect(page).to have_content('Flows')
    expect(page).to have_content('Riparian Vegetation')
    expect(page).to have_content('Native Aquatic Animals')
    expect(page).to have_content('Physical Integrity')
    expect(page).to have_content('Water Quality')
  end
end
