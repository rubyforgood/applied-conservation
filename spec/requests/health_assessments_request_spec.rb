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

    it 'updates the target_health_attr_rating' do
      health_assessment.reload
      expect(health_assessment.rating).to eq 'good'
      expect(health_assessment.name).to eq 'new name'
    end
  end
end
