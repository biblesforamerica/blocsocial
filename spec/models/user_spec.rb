require 'spec_helper'

describe User do
  describe "Relationships" do
    it {should have_many(:likes).dependent(:destroy)}
    it {should have_many(:liked_bookmarks).through(:likes)}
    it {should have_many(:bookmarks)}
  end

  describe "Instance Methods" do

    it "#like a bookmark and have that bookmark in the liked_bookmarks association" do
      user = create(:user)
      bookmark = create(:bookmark)
      
      user.like(bookmark)
      expect(user.liked_bookmarks).to include bookmark
    end

    it "#unlike a bookmark and have it removed from the liked_bookmarks association" do
      user = create(:user)
      bookmark = create(:bookmark)

      user.liked_bookmarks << bookmark
      expect(user.liked_bookmarks).to include bookmark
      user.unlike(bookmark)
      expect(user.liked_bookmarks).to_not include bookmark

    end

  
    
  end
end
