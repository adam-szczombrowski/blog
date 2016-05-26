require 'rails_helper'

feature 'As a signed in user' do
  let(:user) {create(:user)}
  let(:article) { build(:article)}
  before {login_as(user, :scope => :user )}

  scenario 'I can create article with valid attributes' do
    visit '/articles/new'
    fill_in 'Name', with: article.name
    fill_in 'article_content', with: article.content
    expect {click_button 'Create Article'}.to change {Article.count}.by(1)
  end

  scenario 'I can not create article with invalid attributes' do
    visit '/articles/new'
    fill_in 'Name', with: article.name
    fill_in 'article_content', with: nil
    expect {click_button 'Create Article'}.to_not change {Article.count}
  end

end
