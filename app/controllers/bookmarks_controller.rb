class BookmarksController < ApplicationController
  def index
    @bookmarks = current_user.bookmarks
    @tags = []
    current_user.bookmarks.all.collect{|bookmark| @tags << bookmark.tag_list }
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_path
  end
end
