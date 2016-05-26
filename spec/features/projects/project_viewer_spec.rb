require 'rails_helper'

feature 'projects viewer' do
  context 'as a visitor/user ' do
    let!(:projects) { create_list(:project, 10)}
    scenario 'I see names of up to 8 recent projects' do
      visit projects_path
      expect(page).to have_content('Name10')
      expect(page).to have_selector("h2", count: 8)
    end

    scenario 'I am redirected to project page when click on name' do
      visit projects_path
      click_on('Name20')
      expect(current_path).to eq project_path(projects[-1])
    end
  end
end
