require 'spec_helper'

describe IncomingController do
  describe "emails from an existing user" do
    it "should find the user's account by the sender email address" do
      user = create(:user)
      params = incoming_email_params(sender: user.email)
      post :create, params
      expect(assigns(:user)).to eq user
    end

    it "should extract the hashtag from the subject and assign to @hashtag" do
      params = incoming_email_params
      post :create, params
      expect(assigns(:hashtag)).to eq params[:subject]
    end

    it "should assign the body of the email to @url" do
      params = incoming_email_params
      post :create, params
      expect(assigns(:url)).to eq params[:'body-plain']
    end

    it "should attach a url to the user's account" do
      user = create(:user)
      params = incoming_email_params(sender: user.email)
      post :create, params
      expect(user.bookmarks.find_by_url("awesomesite.com")).to be_true
    end


    it "should create the hash tag if the hash tag does not exist" do
      tagname = "Heavenly" 
      params = incoming_email_params(subject: tagname)
      Bookmark.tag_counts.count.should eq(0)
      post :create, params
      Bookmark.tag_counts.count.should eq(1)
      Bookmark.tag_counts.first.name.should eq(tagname)
    end

    it "should assign the new url to the hash tag" do
      tagname = "Heavenly" 
      params = incoming_email_params(subject: tagname)
      post :create, params
      expect(Bookmark.tagged_with(tagname).first.url).to eq params[:'body-plain']
    end

  end
end

def incoming_email_params(options = {})
  {
    sender: "sender@example.com",
    subject: "Some email subject",
    :'body-plain' => "awesomesite.com"
  }.merge(options)
end
