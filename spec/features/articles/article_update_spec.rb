require 'rails_helper'

feature 'As a signed in user' do
  let(:user) {create(:user)}
  let(:article) { create(:article)}
  before {login_as(user, :scope => :user )}

  scenario 'I can edit article with valid attributes' do
    visit edit_article_path(article)
    fill_in 'article_name', with: 'Valid name'
    fill_in 'article_content', with: 'Valid content'
    save_and_open_page
    click_button 'Update Article'
    expect(article.name).to eq 'Valid name'
  end

  scenario 'I can not edit article with invalid attributes' do
    visit edit_article_path(article)
    fill_in 'Name', with: nil
    fill_in 'article_content', with: nil
    click_button 'Update Article'
    expect(current_path).to eq root_path
  end
end
