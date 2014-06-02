class  IncomingController < ApplicationController

  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    @user = User.find_by_email(params[:sender])
    @url = params[:'body-plain'] 
    @hashtag = params[:subject] 

    bookmark = Bookmark.new
    bookmark.url = @url
    bookmark.addtag(@hashtag)

    @user.bookmarks << bookmark

    head 200 # tells mailgun that action completely successfully
  end
  
end
