require 'rails_helper'

feature 'User signs in' do
  let(:user) { User.create(email: 'admin@exmaple.com', password: 'password', password_confirmation: 'password')}
  scenario 'with valid credentials' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end
  scenario 'with invalid credentials' do
    visit new_user_session_path
    fill_in 'Email', with: 'jibberish'
    fill_in 'Password', with: 'jibba'
    click_button 'Log in'
    expect(page).to have_content 'Invalid email or password.'
  end
end
