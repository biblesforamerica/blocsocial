class  IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    # puts "INCOMING PARAMS HERE: #{params}"

    @user = User.find_by_email(params[:sender])
    @url = params[:'body-plain'] 
    @hashtag = params[:subject] 


    head 200
  end
  
end
