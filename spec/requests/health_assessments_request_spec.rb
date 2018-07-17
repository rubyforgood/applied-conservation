require 'rails_helper'

describe 'HealthAssessment Requests', type: :request do
  let!(:health_assessment) { create(:health_assessment, rating: nil) }

  describe 'PUT update' do
    before do
      put "/health_assessments/#{health_assessment.id}",
          params: {
            health_assessment: {
              rating: 'good',
              name: 'new name'
            }
          }
    end

    it 'updates the health_assessment' do
      health_assessment.reload
      expect(health_assessment.rating).to eq 'good'
      expect(health_assessment.name).to eq 'new name'
    end
  end

  describe 'POST create' do
    it 'creates a new health_assessment' do
      target = FactoryBot.create(:target)

      post '/health_assessments',
           params: {
             health_assessment: {
               name: 'new name'
             },
             target_id: target.id
           }

      health_assessment = HealthAssessment.last
      expect(health_assessment.target).to eq target
      expect(health_assessment.name).to eq 'new name'
    end
  end

  describe 'DELETE destroy' do
    it 'deletes the health assessment' do
      deleted_id = health_assessment.id

      delete "/health_assessments/#{deleted_id}"

      expect(HealthAssessment.where(id: deleted_id)).to be_empty
    end
  end
end
