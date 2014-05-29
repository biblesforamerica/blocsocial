require 'spec_helper'

describe Bookmark do

  describe "Relationships" do

    it {should have_many(:likes).dependent(:destroy)}
    it {should belong_to(:user)}
    it {should have_many(:likers).through(:likes)}

  end

  describe "Instance methods" do

    it "#numlikes should show the number of times the bookmark has been liked" do
      bookmark = create(:bookmark)
      5.times do |u|
        u = create(:user)
        u.like(bookmark)
      end
      expect(bookmark.numlikes).to eq 5

    end
  end
end
