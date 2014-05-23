require 'spec_helper'

feature 'User visits homepage and signs in' do
  scenario 'succesfully signin' do
    user = create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content "Welcome"
  end
end
