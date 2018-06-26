require 'rails_helper'

describe 'Target Requests', type: :request do
  let!(:project) { create(:project) }

  describe '#POST create' do
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
  end
end
