require 'rails_helper'

describe 'HealthAttribute Requests', type: :request do
  let(:target) { create(:target) }

  before do
    sign_in(create(:user))
  end

  describe 'PUT update' do
    let(:health_attribute) { create(:health_attribute, target: target) }
    it 'updates the health_attribute amd sends a success flash message' do
      put "/health_attributes/#{health_attribute.id}",
          params: {
            target_id: target.id,
            health_attribute: {
              name: 'new name'
            }
          }

      health_attribute.reload
      expect(health_attribute.name).to eq 'new name'
      expect(flash[:notice]).to be_present
    end

    it 'does not update the health attribute and sends an error flash message when invalid params' do
      expect do
        put "/health_attributes/#{health_attribute.id}",
            params: {
              target_id: target.id,
              health_attribute: {
                name: ''
              }
            }
      end.to_not change(health_attribute, :name)

      expect(flash[:alert]).to be_present
    end
  end

  describe 'POST create' do
    it 'creates a new health_attribute and sends a success flash message' do
      post '/health_attributes',
           params: {
             health_attribute: {
               name: 'new name'
             },
             target_id: target.id
           }

      health_attribute = HealthAttribute.last
      expect(health_attribute.target).to eq target
      expect(health_attribute.name).to eq 'new name'
      expect(flash[:notice]).to be_present
    end

    it 'does not create a health_attribute and sends an error flash message when invalid params' do
      expect do
        post '/health_attributes',
             params: {
               health_attribute: {
                 name: ''
               },
               target_id: target.id
             }
      end.to_not change(HealthAttribute, :count)

      expect(flash[:alert]).to be_present
    end
  end

  describe 'DELETE destroy' do
    let(:health_attribute) { create(:health_attribute, target: target) }

    it 'deletes the health attribute and sends a success flash message' do
      deleted_id = health_attribute.id

      delete "/health_attributes/#{deleted_id}"

      expect(HealthAttribute.where(id: deleted_id)).to be_empty
      expect(flash[:notice]).to be_present
    end
  end
end
