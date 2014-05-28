require 'spec_helper'

feature 'User visits bookmarks index and sees the bookmarks he has saved' do
  scenario 'sees the bookmarks he owns' do

    #set up
    user = create(:user)
    create(:bookmark, user: user, url: "google.com")
    create(:bookmark, user: user, url: "apple.com")


    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    visit bookmarks_path

    expect(page).to have_content "google.com"
    expect(page).to have_content "apple.com"
  end



  scenario "does not see the ones he does not own"

  scenario "sees his bookmarks categorized by tag"











end
