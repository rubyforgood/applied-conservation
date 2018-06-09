require 'rails_helper'

feature 'Target Health Attributes' do
  before do
    # create user David
    # create 5 health attributes belong to Freshwater Ecosystem targetType
    @project = Project.create(name: 'Saving Bobs Lake from oil pollution', description: 'its a lake')
    target_type = TargetType.create(name: 'Lake')
    @target = Target.create(name: 'Bobs Lake', project: @project, target_type_id: target_type.id)
    binding.pry
    health_attribute1 = HealthAttribute.create(title: 'Flows', target_types_id: target_type.id)
    health_attribute2 = HealthAttribute.create(title: 'Riparian Vegetation', target_types_id: target_type.id)
    health_attribute3 = HealthAttribute.create(title: 'Native Aquatic Animals', target_types_id: target_type.id)
    health_attribute4 = HealthAttribute.create(title: 'Physical Integrity',target_types_id: target_type.id)
    health_attribute5 = HealthAttribute.create(title: 'Water Quality', target_types_id: target_type.id)
  end

  scenario 'User can view target health attributes' do
    visit project_target_path(@project, @target)

    expect(page).to have_content('Health Attributes')

    # expect to see 5 health attributes
    expect(page).to have_content('Flows')
    expect(page).to have_content('Riparian Vegetation')
    expect(page).to have_content('Native Aquatic Animals')
    expect(page).to have_content('Physical Integrity')
    expect(page).to have_content('Water Quality')

  end

end
