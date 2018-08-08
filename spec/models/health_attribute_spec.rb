require 'rails_helper'

describe HealthAttribute, type: :model do
  let!(:health_attribute) { create(:health_attribute) }

  it { expect(health_attribute).to validate_presence_of :name }

  describe '#current_health_assessment' do
    it 'returns the health_assessment with assessment_type = current' do
      current_health_assessment = create(:health_assessment, health_attribute: health_attribute, assessment_type: 'current')
      create(:health_assessment, health_attribute: health_attribute, assessment_type: 'other')

      expect(health_attribute.current_health_assessment).to eq current_health_assessment
    end
  end
end
