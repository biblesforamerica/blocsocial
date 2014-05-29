require 'spec_helper'

feature 'User visits his own liked bookmark page' do
  scenario 'sees the bookmarks he likes successfully' do

    #set up
    user = create(:user)
    user1 = create(:user)
    bookmark = create(:bookmark, user: user, url: "google.com")


    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Sign in'

    visit bookmarks_path
    user1.like(bookmark)
    visit likes_path
    
    expect(page).to have_content "google.com"
  end
end
