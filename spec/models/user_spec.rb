require 'spec_helper'

describe User do
  describe "Relationships" do

    it {should have_many(:likes)}
    it {should have_many(:liked_bookmarks).through(:likes)}
    it {should have_many(:bookmarks)}

  end
end
