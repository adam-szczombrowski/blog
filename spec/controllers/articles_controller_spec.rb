require 'rails_helper'

describe ArticlesController do
  describe 'GET #index' do
    let(:articles) {create_list(:article, 2)}
    before { get :index}
    it 'renders the index template' do
      expect(response).to render_template('index')
    end
    it 'responds successfully with an HTTP 200 status code' do
      expect_successfull_response
    end
    it 'loads all articles into @articles in desc order' do
      expect(assigns(:articles)).to match_array(articles.reverse)
    end
  end

  describe 'GET #show' do
    let(:article) {create(:article)}
    before {get :show,id: article.id}
    it 'renders the show template' do
      expect(response).to render_template('show')
    end
    it 'responds successfully with an HTTP 200 status code' do
      expect_successfull_response
    end
    it 'loads article into @article' do
      expect(assigns(:article)).to match article
    end
  end

  describe 'GET #new' do
    context 'when user is signed in' do
      before {sign_in}
      before {get :new}
      it 'renders the new template' do
        expect(response).to render_template('new')
      end
      it 'load new article in @article' do
        expect(assigns(:article).attributes).to match Article.new.attributes
      end
      it 'responds successfully with an HTTP 200 status code' do
        expect_successfull_response
      end
    end
    context 'when user is not signed in' do
      it 'redirects to root path' do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'POST #create' do
    before {sign_in}
    context 'with valid attributes' do
      it 'creates a new article' do
        expect {post :create, article: attributes_for(:article)}.to change{Article.count}.by(1)
      end
      it 'redirects to the new article' do
        post :create, article: attributes_for(:article)
        expect(response).to redirect_to Article.last
      end
    end
    context 'with invalid attributes' do
      it 'does not save the new article' do
        expect {post :create, article: {name: nil}}.to_not change {Article.count}
      end
      it 'redirects to root path' do
        post :create, article: {name: nil}
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'GET #edit' do
    before {sign_in}
    let(:article) {create(:article)}
    before {get :edit, id: article.id}
    it 'renders the edit template' do
      expect(response).to render_template('edit')
    end
    it 'responds successfully with an HTTP 200 status code' do
      expect_successfull_response
    end
    it 'loads article into @article' do
      expect(assigns(:article)).to match article
    end
  end

  describe 'PUT #update' do
    let(:article) { create(:article) }
    before { sign_in }
    context 'with valid attributes' do
      it 'updates the article' do
        put :update, id: article.id, article: attributes_for(:article, name: 'title')
        article.reload
        expect(article.name).to eql 'title'
      end
      it 'redirects to updated contact' do
        put :update, id: article.id, article: attributes_for(:article)
        expect(response).to redirect_to article
      end
    end
    context 'with invalid attributes' do

      it 'does not updat the article' do
        name = article.name
        put :update, id: article.id, article: attributes_for(:article, name: nil)
        expect(article.name).to eql name
      end
      it 'redirects to root path' do
        put :update, id: article.id, article: attributes_for(:article, name: nil)
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:article) { create(:article) }
    it 'deletes the contact' do
      expect{ delete :destroy, id: article.id}.to change{Article.count}.by(1)
    end
    it 'redirects to articles path' do
      sign_in
      delete :destroy, id: article.id
      expect(response).to redirect_to articles_path
    end
  end
end
