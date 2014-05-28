require 'spec_helper'

describe Bookmark do


  describe "Relationships" do

    it {should have_many(:likes)}
    it {should belong_to(:user)}
    it {should have_many(:likers).through(:likes)}

  end
end
