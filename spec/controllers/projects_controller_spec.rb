require 'rails_helper'

describe ProjectsController do
  describe 'GET #index' do
    let(:projects) {create_list(:project, 2)}
    before { get :index}
    it 'renders the index template' do
      expect(response).to render_template('index')
    end
    it 'responds successfully with an HTTP 200 status code' do
      expect_successfull_response
    end
    it 'loads all projects into @projects in desc order' do
      expect(assigns(:projects)).to match_array(projects.reverse)
    end
  end

  describe 'GET #show' do
    let(:project) {create(:project)}
    before {get :show,id: project.id}
    it 'renders the show template' do
      expect(response).to render_template('show')
    end
    it 'responds successfully with an HTTP 200 status code' do
      expect_successfull_response
    end
    it 'loads project into @project' do
      expect(assigns(:project)).to match project
    end
  end

  describe 'GET #new' do
    context 'when user is signed in' do
      before {sign_in}
      before {get :new}
      it 'renders the new template' do
        expect(response).to render_template('new')
      end
      it 'load new project in @project' do
        expect(assigns(:project).attributes).to match Project.new.attributes
      end
      it 'responds successfully with an HTTP 200 status code' do
        expect_successfull_response
      end
    end
    context 'when user is not signed in' do
      it 'redirects to sign in path' do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'POST #create' do
    before {sign_in}
    context 'with valid attributes' do
      it 'creates a new project' do
        expect {post :create, project: attributes_for(:project)}.to change{Project.count}.by(1)
      end
      it 'redirects to the new project' do
        post :create, project: attributes_for(:project)
        expect(response).to redirect_to Project.last
      end
    end
    context 'with invalid attributes' do
      it 'does not save the new project' do
        expect {post :create, project: {name: nil}}.to_not change {Project.count}
      end
      it 'redirects to root path' do
        post :create, project: {name: nil}
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'GET #edit' do
    before {sign_in}
    let(:project) {create(:project)}
    before {get :edit, id: project.id}
    it 'renders the edit template' do
      expect(response).to render_template('edit')
    end
    it 'responds successfully with an HTTP 200 status code' do
      expect_successfull_response
    end
    it 'loads project into @project' do
      expect(assigns(:project)).to match project
    end
  end

  describe 'PUT #update' do
    let(:project) { create(:project) }
    before { sign_in }
    context 'with valid attributes' do
      it 'updates the project' do
        put :update, id: project.id, project: attributes_for(:project, name: 'title')
        project.reload
        expect(project.name).to eql 'title'
      end
      it 'redirects to updated project' do
        put :update, id: project.id, project: attributes_for(:project)
        expect(response).to redirect_to project
      end
    end
    context 'with invalid attributes' do
      it 'does not update the project' do
        name = project.name
        put :update, id: project.id, project: attributes_for(:project, name: nil)
        expect(project.name).to eql name
      end
      it 'redirects to root path' do
        put :update, id: project.id, project: attributes_for(:project, name: nil)
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:project) { create(:project) }
    it 'deletes the contact' do
      expect{ delete :destroy, id: project.id}.to change{Project.count}.by(1)
    end
    it 'redirects to articles path' do
      sign_in
      delete :destroy, id: project.id
      expect(response).to redirect_to projects_path
    end
  end
end
