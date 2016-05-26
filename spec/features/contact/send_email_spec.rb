require 'rails_helper'

feature 'I can contact with site owner' do
  scenario 'throught the contact form' do
    visit new_contact_path
    fill_in 'contact_name', with: 'name'
    fill_in 'contact_email', with: 'example@example.com'
    fill_in 'contact_message', with: 'message'
    click_on 'Send Message'
    expect(page).to have_content 'Thank you for your message!'
  end
end
