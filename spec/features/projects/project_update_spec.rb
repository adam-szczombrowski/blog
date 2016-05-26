require 'rails_helper'

feature 'As a signed in user' do
  let(:user) {create(:user)}
  let(:project) { create(:project)}
  before {login_as(user, :scope => :user )}

  scenario 'I can edit project with valid attributes' do
    visit edit_project_path(project)
    fill_in 'project_name', with: 'Valid name'
    fill_in 'project_description', with: 'Valid content'
    fill_in 'project_link', with: 'Valid link'
    click_button 'Update Project'
    expect(project.reload.name).to eq 'Valid name'
  end

  scenario 'I can not edit project with invalid attributes' do
    visit edit_project_path(project)
    fill_in 'project_name', with: nil
    fill_in 'project_description', with: nil
    fill_in 'project_link', with: nil
    click_button 'Update Project'
    expect(current_path).to eq root_path
  end

end
