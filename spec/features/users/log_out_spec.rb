require 'rails_helper'

feature 'user logs out' do
  let(:user) {create(:user)}
  scenario 'successfully' do
    login_as(user, :scope => :user)
    visit '/'
    click_link 'Log out'
    expect(page).to have_content 'Signed out successfully.'
  end
end
