require 'spec_helper'

feature 'User visits my bookmarks index' do 

  let(:user) {create(:user)}
  let(:user2) {create(:user)}

  scenario 'sees the bookmarks he owns' do
    tag = "Powerhouse"
    create(:bookmark, user: user, url: "google.com", tag_list: tag )
    create(:bookmark, user: user, url: "apple.com", tag_list: tag ) 

    login(user)
    visit my_bookmarks_path
    expect(page).to have_content "google.com"
    expect(page).to have_content "apple.com"
  end

  scenario "does not see the ones he does not own" do
    create(:bookmark, user: user2, url: "user2.me")
    login(user) 
    visit my_bookmarks_path
    expect(page).to_not have_content "user2.me"
  end

  scenario "sees his bookmarks categorized by tag" do
    tag = "Economy"
    url = "www.lettheword.com"
    create(:bookmark, user: user, url: url, tag_list: tag )

    login(user)
    visit my_bookmarks_path
    within("##{tag}") do
      expect(page).to have_content (url)
    end
  end

  scenario "see multiple bookmarks with multiple hashtags" do
    tag = "Economy"
    tag2 = "Search"
    create(:bookmark, user: user, url: "www.lettheword.com", tag_list: tag )
    create(:bookmark, user: user, url: "www.google.com", tag_list: tag2 )
    create(:bookmark, user: user, url: "www.ministrybooks.org", tag_list: [tag,tag2] )

    login(user)
    visit my_bookmarks_path
    save_and_open_page
  end
end
