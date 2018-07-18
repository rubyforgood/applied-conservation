require 'rails_helper'

describe 'HealthAssessment Requests', type: :request do
  let(:target) { create(:target) }

  describe 'PUT update' do
    let(:health_assessment) { create(:health_assessment, target: target, rating: nil) }
    it 'updates the health_assessment amd sends a success flash message' do
      put "/health_assessments/#{health_assessment.id}",
          params: {
            target_id: target.id,
            health_assessment: {
              rating: 'good',
              name: 'new name'
            }
          }

      health_assessment.reload
      expect(health_assessment.rating).to eq 'good'
      expect(health_assessment.name).to eq 'new name'
      expect(flash[:success]).to be_present
    end

    it 'does not update the health assessment and sends an error flash message when invalid params' do
      expect do
        put "/health_assessments/#{health_assessment.id}",
            params: {
              target_id: target.id,
              health_assessment: {
                rating: 'good',
                name: ''
              }
            }
      end.to_not change(health_assessment, :name)

      expect(flash[:error]).to be_present
    end
  end

  describe 'POST create' do
    it 'creates a new health_assessment and sends a success flash message' do
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
      expect(flash[:success]).to be_present
    end

    it 'does not create a health_assessment and sends an error flash message when invalid params' do
      expect do
        post '/health_assessments',
             params: {
               health_assessment: {
                 name: ''
               },
               target_id: target.id
             }
      end.to_not change(HealthAssessment, :count)

      expect(flash[:error]).to be_present
    end
  end

  describe 'DELETE destroy' do
    let(:health_assessment) { create(:health_assessment, target: target, rating: nil) }

    it 'deletes the health assessment and sends a success flash message' do
      deleted_id = health_assessment.id

      delete "/health_assessments/#{deleted_id}"

      expect(HealthAssessment.where(id: deleted_id)).to be_empty
      expect(flash[:success]).to be_present
    end
  end
end
