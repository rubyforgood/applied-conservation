require 'rails_helper'

describe 'HealthAssessment Requests', type: :request do
  let!(:health_rating_type) { create(:health_rating_type, name: "good") }
  let!(:health_rating) { create(:health_rating, health_rating_type: health_rating_type) }
  let!(:health_assessment) { create(:health_assessment, health_rating: health_rating) }

  describe 'PUT update' do
    before do
      put "/health_assessments/#{health_assessment.id}",
          params: {
            health_assessment: {
              health_rating: 'good',
              name: 'new name'
            }
          }
    end

    it 'updates the target_health_attr_rating' do
      health_assessment.reload
      expect(health_assessment.health_rating.name).to eq 'good'
      expect(health_assessment.name).to eq 'new name'
    end
  end
end
