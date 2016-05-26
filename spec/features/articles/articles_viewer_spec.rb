require 'rails_helper'

feature 'articles viewing' do
  context 'as a visitor/user ' do
    let!(:articles) { create_list(:article, 10)}
    scenario 'I see up to 8 recent articles on a page' do
      visit articles_path
      expect(page).to have_content('Name10')
      expect(page).to have_selector("h2", count: 8)
    end

    scenario 'I am redirected to article page when click on article name' do
      visit articles_path
      click_on('Name20')
      expect(current_path).to eq article_path(articles[-1])
    end
  end
end
