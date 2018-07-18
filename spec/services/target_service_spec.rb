require 'rails_helper'

describe TargetService do
  describe '#create' do
    describe 'generating health_assessments' do
      before do
        create(:health_attribute, target_type: create(:target_type))
      end

      it 'generates a list of health_assessments based on the given target_type' do
        health_attribute = create(:health_attribute)
        target = create(:target, target_type: health_attribute.target_type)
        target_service = TargetService.new target

        expect { target_service.create }.to change(HealthAssessment, :count).by 1

        target.reload
        health_assessment = target.health_assessments.last
        expect(health_assessment.name).to eq health_attribute.title
      end

      it 'does not generate any health_assessment when target has no target_type' do
        target = create(:target, target_type: nil)
        target_service = TargetService.new(target)

        expect { target_service.create }.to_not change(HealthAssessment, :count)
      end
    end
  end
end
