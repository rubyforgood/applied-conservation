require 'rails_helper'

describe 'Target Health Attribute Rating Requests', type: :request do
  let!(:target_health_attribute_rating) { create(:target_health_attribute_rating, rating: nil) }

  describe 'PUT update' do
    before do
      put "/target_health_attribute_ratings/#{target_health_attribute_rating.id}",
          params: {
            target_health_attribute_rating: {
              rating: 'good',
              name: 'new name'
            }
          }
    end

    it 'updates the target_health_attr_rating' do
      target_health_attribute_rating.reload
      expect(target_health_attribute_rating.rating).to eq 'good'
      expect(target_health_attribute_rating.name).to eq 'new name'
    end
  end
end
