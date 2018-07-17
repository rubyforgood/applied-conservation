require 'rails_helper'

describe TargetService do
  describe '#create' do
    it 'creates a new target' do
      target = FactoryBot.build :target
      target_service = TargetService.new target

      expect { target_service.create }.to change(Target, :count).by 1
    end

    describe 'generating health_assessments' do
      before do
        FactoryBot.create(:health_attribute, target_type: FactoryBot.create(:target_type))
      end

      it 'generates a list of health_assessments based on the given target_type' do
        health_attribute = FactoryBot.create(:health_attribute)
        target = FactoryBot.build(:target, target_type: health_attribute.target_type)
        target_service = TargetService.new target

        expect { target_service.create }.to change(HealthAssessment, :count).by 1

        target.reload
        health_assessment = target.health_assessments.last
        expect(health_assessment.name).to eq health_attribute.title
      end

      it 'does not generate any health_assessment when target has no target_type' do
        target = FactoryBot.build(:target, target_type: nil)
        target_service = TargetService.new(target)

        expect { target_service.create }.to_not change(HealthAssessment, :count)
      end
    end

    describe 'target_params are not valid' do
      let(:target_service) { TargetService.new(FactoryBot.build(:target, project: nil)) }

      it 'does not create a new target' do
        expect { target_service.create }.to_not change(Target, :count)
      end

      it 'returns nil' do
        expect(target_service.create).to be_nil
      end
    end
  end
end
