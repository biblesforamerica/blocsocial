require 'spec_helper'


describe IncomingController do
  describe "emails from an existing user" do
    it "should find the user's account by the sender email address" do
      user = create(:user)
      params = incoming_email_params(sender: user.email)
      post :create, params
      expect(assigns(:user)).to eq user
    end

    it "should retieve the user's hashtag from subject line" do
      params = incoming_email_params
      post :create, params
      expect(assigns(:hashtag)).to eq params[:subject]
    end

    it "should assign the body of the email to @url" do
      params = incoming_email_params
      post :create, params
      expect(assigns(:url)).to eq params[:'body-plain']
    end

    it "should attach a url to the user's account"

    it "should create the hash tag if the hash tag does not exist"

    it "should assign the hash tag to @hashtag"

    it "should assign the new url to the hash tag"



  end
end


def incoming_email_params(options = {})
  {
    sender: "sender@example.com",
    subject: "Some email subject",
    :'body-plain' => "Body of the email"
  }.merge(options)
end
