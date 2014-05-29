class LikesController < ApplicationController
  def index
    @my_liked_bookmarks = current_user.liked_bookmarks
  end
end
