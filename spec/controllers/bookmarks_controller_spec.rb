require 'spec_helper'

describe BookmarksController do
  describe 'DELETE #destroy' do
    it "deletes the bookmark from the database" do
      @bookmark = create(:bookmark)
      expect{
        delete :destroy, id: @bookmark
      }.to change(Bookmark,:count).by(-1)
    end

    it "redirects to bookmarks#index" do
      @bookmark = create(:bookmark)
      delete :destroy, id: @bookmark
      expect(response).to redirect_to bookmarks_url
    end
  end
end
