require 'rails_helper'

feature 'As a signed in user' do
  let(:user) {create(:user)}
  let(:project) { build(:project)}
  before {login_as(user, :scope => :user )}

  scenario 'I can create project with valid attributes' do
    visit new_project_path
    fill_in 'project_name', with: project.name
    fill_in 'project_description', with: project.description
    fill_in 'project_link', with: project.link
    expect {click_button 'Create Project'}.to change {Project.count}.by(1)
  end

  scenario 'I can not create project with invalid attributes' do
    visit new_project_path
    fill_in 'project_name', with: project.name
    fill_in 'project_description', with: nil
    expect {click_button 'Create Project'}.to_not change {Project.count}
  end

end
