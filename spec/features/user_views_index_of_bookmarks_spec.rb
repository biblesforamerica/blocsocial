require 'spec_helper'

feature 'User visits bookmarks index' do 

  let(:user) {create(:user)}
  let(:user2) {create(:user)}

  scenario 'sees the bookmarks he owns' do
    tag = "Powerhouse"
    create(:bookmark, user: user, url: "google.com", tag_list: tag )
    create(:bookmark, user: user, url: "apple.com", tag_list: tag ) 

    login(user)
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
    tag = "Economy"
    url = "www.lettheword.com"
    create(:bookmark, user: user, url: url, tag_list: tag )

    login(user)
    visit bookmarks_path
    within("##{tag}") do
      expect(page).to have_content (url)
    end
  end
end
