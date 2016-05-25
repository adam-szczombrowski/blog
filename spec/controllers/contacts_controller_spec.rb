require 'rails_helper'

describe ContactsController do
  describe 'GET #new' do
    before { get :new }
    it 'renders the contact template' do
      expect(response).to render_template('new')
    end
    it 'responds successfully with an HTTP 200 status code' do
      expect_successfull_response
    end
    it 'loads contact new into @contact ' do
      expect(assigns(:contact).mail_attributes).to match Contact.new.mail_attributes
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'responds successfully with an HTTP 200 status code' do
        post :create, contact: {name: 'name', email: 'name@example.com', message: 'message'}
        expect_successfull_response
      end
    end
    context 'with invalid attributes' do
      it 'redirects to root path' do
        post :create, contact: {name: nil}
        expect(response).to redirect_to root_path
      end
    end
  end
end
