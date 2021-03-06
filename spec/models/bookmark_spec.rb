require 'spec_helper'

describe Bookmark do

  describe "Relationships" do

    it {should have_many(:likes).dependent(:destroy)}
    it {should belong_to(:user)}
    it {should have_many(:likers).through(:likes)}

  end

  describe "Instance methods" do

    describe "#numlikes" do
      it "should show the number of times the bookmark has been liked" do
        bookmark = create(:bookmark)
        5.times do |u|
          u = create(:user)
          u.like(bookmark)
        end
        expect(bookmark.numlikes).to eq 5
      end
    end

    describe "#addtag" do
      it "should create a hashtag if it does not exist " do
        bookmark = create(:bookmark)
        bookmark.addtag("Random")
        expect(bookmark.tag_list).to include "Random"
      end
    end
  end

  describe  "Custom scopes" do
    describe "by_join_date" do
      it "should sort in descendding order based on created at" do
        yesterday = create(:bookmark, created_at: 1.days.ago)
        lastweek = create(:bookmark, created_at: 7.days.ago)
        expect(Bookmark.by_join_date).to eq [yesterday, lastweek]
      end
    end
  end

  
end
