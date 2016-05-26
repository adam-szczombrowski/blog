require 'rails_helper'

feature 'As a signed in user' do
  let(:user) {create(:user)}
  let(:article) { create(:article)}
  before {login_as(user, :scope => :user )}

  scenario 'I can delete article' do
    visit article_path(article)
    expect {click_on 'Destroy'}.to change {Article.count}.by(-1)
  end
end
