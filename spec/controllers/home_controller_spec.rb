require 'rails_helper'

describe HomeController do
  let(:articles) {create_list(:article, 5)}
  let(:projects) {create_list(:project, 5)}
  before {get :welcome}
  describe 'GET #welcome' do
    it 'renders the welcome template' do
      expect(response).to render_template('welcome')
    end
    it 'responds successfully with an HTTP 200 status code' do
      expect_successfull_response
    end
    it 'loads max 4 projects into @projects in desc order' do
      expect(assigns(:projects)).to match_array(projects[1,5].reverse)
      expect(assigns(:projects).length).to eq 4
    end
    it 'loads max 4 articles into @articles in desc order' do
      expect(assigns(:articles)).to match_array(articles[1,5].reverse)
      expect(assigns(:articles).length).to eq 4
    end
  end
end
