require 'rails_helper'

describe 'Target Requests', type: :request do
  let!(:project) { create(:project) }

  describe 'POST create' do
    it 'creates a new target and redirects to the target show page' do
      post '/targets',
           params: {
             project_id: project.id,
             target: { name: 'new target' }
           }

      target = Target.last
      expect(target.project).to eq project
      expect(response).to redirect_to(target_url(target))
    end

    it 'does not create a new target and sends an error flash message when invalid params' do
      expect do
        post '/targets',
             params: {
               project_id: project.id,
               target: { name: '' }
             }
      end.to_not change(Target, :count)

      expect(flash[:error]).to be_present
    end
  end

  describe 'GET edit' do
    let(:target) { create(:target) }

    it 'renders the edit template' do
      get edit_target_path(target)

      expect(response).to render_template 'edit'
    end
  end

  describe 'PUT update' do
    let(:target) { create(:target) }

    it 'updates the target and sends a success flash message' do
      put "/targets/#{target.id}",
          params: {
            project_id: project.id,
            target: { name: 'Name' }
          }

      target.reload
      expect(target.name).to eq 'Name'

      expect(flash[:success]).to be_present
    end

    it 'does not update the target and sends an error flash message when invalid params' do
      expect do
        put "/targets/#{target.id}",
            params: {
              project_id: project.id,
              target: { name: '' }
            }
      end.to_not change(target, :name)

      expect(flash[:error]).to be_present
    end
  end
end
