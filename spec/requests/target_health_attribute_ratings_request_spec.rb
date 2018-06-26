require 'rails_helper'

describe 'Target Health Attribute Rating Requests', type: :request do
  let!(:target_health_attribute_rating) { create(:target_health_attribute_rating, rating: nil) }

  describe 'PUT update' do
    before do
      put "/target_health_attribute_ratings/#{target_health_attribute_rating.id}",
          params: {
            target_health_attribute_rating: {
              rating: "good"
            }
          }
    end

    it 'updates the target_health_attr_rating' do
      target_health_attribute_rating.reload
      expect(target_health_attribute_rating.rating).to eq 'good'
    end

    it 'redirects to the target show path' do
      target = target_health_attribute_rating.target
      expect(response).to redirect_to target_path(target)
    end
  end
end