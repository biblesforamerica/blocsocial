require 'spec_helper'

feature 'User visits bookmarks index and sees the bookmarks he has saved' do

  let(:user) {create(:user)}
  let(:user2) {create(:user)}


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



  scenario "does not see the ones he does not own" do

    create(:bookmark, user: user2, url: "user2.me")

    login(user) 
    visit bookmarks_path

    expect(page).to_not have_content "user2.me"
  end


  scenario "sees his bookmarks categorized by tag" do
    @b = create(:bookmark, user: user, url: "user.me")
    @b.tag_list.add("God's Economy")
    @b.save
    login(user)
    visit bookmarks_path

    expect(page).to have_content ("God's Economy")
  end






end
