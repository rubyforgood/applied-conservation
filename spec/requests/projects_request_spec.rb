require 'rails_helper'

describe 'Project Requests', type: :request do
  let(:user) { create(:user) }
  let(:new_user) { create(:user) }
  let(:project) { create(:project, users: [user]) }
  let(:new_project) { create(:project, users:[new_user]) }
  let!(:task) { create(:task, project: project) }
  let!(:archived_task) { create(:task, :archived, project: project) }

  before do
    sign_in(user)
  end

  describe 'GET index' do
    it 'returns Projects index page with created project' do
      get '/projects'

      expect(response).to have_http_status 200
      expect(response.body).to include('Projects')
      expect(response.body).to include(project.name)
      expect(response.body).to_not include(new_project.name)
    end
  end

  describe 'GET SHOW' do
    context 'when a project is associated to user' do
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
    context 'when a project is not associated to the user' do
      subject { get project_path(new_project.id) }

      it 'should be redirect_to index' do
        expect(subject).to redirect_to(projects_path)
      end
    end
  end

  describe 'POST create' do
    describe 'success' do
      it 'creates project and redirects to project show' do
        post '/projects', params: { project: attributes_for(:project) }

        expect(response).to have_http_status :found
        expect(response).to redirect_to(project_path(Project.last))
        expect(Project.last.users.count).to eq 1
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
    context 'when editing a project that users is associated with' do
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
    context 'if somehow the user try to edit a project that not he\'s not associated with' do
      it 'then it should be redirected to index page, and data must\'t be updated' do
        put "/projects/#{new_project.id}", params: { project: { name: 'Bender saves the ocean' } }
        expect(response).to redirect_to(projects_path)

        follow_redirect!
        expect(response.body).to_not include('Bender saves the ocean')
      end
    end
  end
end
