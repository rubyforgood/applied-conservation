require 'rails_helper'

describe 'Target Requests', type: :request do
  let!(:project) { FactoryBot.create(:project) }

  describe '#POST create' do
    it 'returns an 302 (FOUND) status and redirects to the target show' do
      post "/projects/#{project.id}/targets", {
           params: {
             target: { project_id: project.id, name: 'new target' }
           }
      }

      expect(response).to have_http_status :found
      expect(response).to redirect_to(project_target_url(project, Target.last))
    end
  end
end