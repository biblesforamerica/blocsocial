class BookmarksController < ApplicationController
  def index
    @bookmarks = current_user.bookmarks
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_path
  end
end
