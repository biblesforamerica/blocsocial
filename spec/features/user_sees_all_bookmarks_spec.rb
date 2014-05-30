require 'spec_helper'

feature 'User sees index of all bookmarks' do

  let(:user) {create(:user)}
  let(:user2) {create(:user)}

  scenario 'sees all bookmarks successfully' do
    tag = "Powerhouse"
    create(:bookmark, user: user, url: "google.com", tag_list: tag )
    create(:bookmark, user: user2, url: "apple.com", tag_list: tag )

    login(user)
    visit bookmarks_path
    expect(page).to have_content "google.com"
    expect(page).to have_content "apple.com"
  end

  scenario 'sees all hashes successfully' do
    tag = "Powerhouse"
    tag2 = "Sports"

    create(:bookmark, user: user, url: "google.com", tag_list: tag )
    create(:bookmark, user: user2, url: "apple.com", tag_list: tag)

    create(:bookmark, user: user2, url: "espn.com", tag_list: tag2 )
    create(:bookmark, user: user2, url: "nba.com", tag_list: tag2 )

    login(user)
    visit bookmarks_path
    expect(page).to have_content "Powerhouse"
  end
end
