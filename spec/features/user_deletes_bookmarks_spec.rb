require 'spec_helper'

feature 'User deletes a bookmark he submitted' do
  scenario 'successfully' do
    url = "readhisword.com" 
    user = create :user 
    create :bookmark, user: user, url: url, tag_list: ["Spirit"]

    login(user)
    visit my_bookmarks_path
    expect(page).to have_content(url)
    click_link "delete"
    expect(page).to have_content("Successfully deleted wiki")
    expect(page).to_not have_content(url)
  end

  scenario "cannot delete someone else's bookmarks"
end
