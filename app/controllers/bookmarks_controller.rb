class BookmarksController < ApplicationController
  def index
    @all_bookmarks = Bookmark.all

    @tags = []
    @all_bookmarks.collect{|bookmark| @tags << bookmark.tag_list }
    @tags = @tags.uniq
  end

  def my_bookmarks
    @my_bookmarks = current_user.bookmarks
    @tags = current_user.my_hashes #bookmarks are grouped by hashes, which are like topics
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      flash[:notice] = "Successfully deleted wiki"
    end
    redirect_to bookmarks_path
  end
end
