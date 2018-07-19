require 'rails_helper'

describe 'Project Requests', type: :request do
  let(:project) { create(:project) }
  let(:new_project) { build(:project) }
  let!(:task) { create(:task, project: project) }
  let!(:archived_task) { create(:task, :archived, project: project) }

  before do
    login_any_user
  end

  describe 'GET index' do
    it 'returns Projects index page with created project' do
      get '/projects'

      expect(response).to have_http_status 200
      expect(response.body).to include('Projects')
      expect(response.body).to include(project.name)
    end
  end

  describe 'GET SHOW' do
    before do
      get "/projects/#{project.id}"
    end

    it 'excludes archived tasks' do
      expect(response.body).to_not include(archived_task.name)
    end

    it 'includes non-archived tasks' do
      expect(response.body).to include(task.name)
    end
  end

  describe 'POST create' do
    describe 'success' do
      it 'creates project and redirects to project show' do
        post '/projects', params: { project: attributes_for(:project) }

        expect(response).to have_http_status :found
        expect(response).to redirect_to(project_path(Project.last))
      end
    end

    describe 'failure' do
      it 'shows errors' do
        post '/projects', params: { project: attributes_for(:project, name: '') }

        expect(response).to have_http_status 422
        expect(response.body).to include('Name can&#39;t be blank')
      end
    end
  end

  describe 'PUT update' do
    describe 'success' do
      it 'updates the project' do
        put "/projects/#{project.id}", params: { project: { name: 'Bender saves the ocean' } }
        follow_redirect!

        expect(response.body).to include('Bender saves the ocean')
      end
    end

    describe 'failure' do
      it 'shows errors' do
        put "/projects/#{project.id}", params: { project: { name: '' } }

        expect(response).to have_http_status 422
        expect(response.body).to include('Name can&#39;t be blank')
      end
    end
  end
end
