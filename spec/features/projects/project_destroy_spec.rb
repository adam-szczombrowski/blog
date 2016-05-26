require 'rails_helper'

feature 'As a signed in user' do
  let(:user) {create(:user)}
  let(:project) { create(:project)}
  before {login_as(user, :scope => :user )}

  scenario 'I can delete project' do
    visit project_path(project)
    expect {click_on 'Destroy'}.to change {Project.count}.by(-1)
  end
end
