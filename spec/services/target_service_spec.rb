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
        FactoryBot.create(:default_health_attribute, target_type: FactoryBot.create(:target_type))
      end

      it 'generates a list of health_attributes based on the given target_type' do
        default_health_attribute = FactoryBot.create(:default_health_attribute)
        target = FactoryBot.build(:target, target_type: default_health_attribute.target_type)
        target_service = TargetService.new target

        expect { target_service.create }.to change(HealthAttribute, :count).by 1

        target.reload
        health_attribute = target.health_attributes.last
        expect(health_attribute.default_health_attribute).to eq default_health_attribute
        expect(health_attribute.name).to eq default_health_attribute.name
      end

      it 'generates current, projected future with NO action, and projected future with action health_assessment for each health_attribute' do
        default_health_attribute = FactoryBot.create(:default_health_attribute)
        target = FactoryBot.build(:target, target_type: default_health_attribute.target_type)
        target_service = TargetService.new target

        expect { target_service.create }.to change(HealthAssessment, :count).by 3

        target.reload
        health_attribute = target.health_attributes.last

        assessment_types = health_attribute.health_assessments.map(&:assessment_type)
        expect(assessment_types).to include('current', 'projected future with NO action', 'projected future with action')
      end

      it 'does not generate any health_attributes when target has no target_type' do
        target = FactoryBot.build(:target, target_type: nil)
        target_service = TargetService.new(target)

        expect { target_service.create }.to_not change(DefaultHealthAttribute, :count)
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
