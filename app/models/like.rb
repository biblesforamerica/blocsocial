class Like < ActiveRecord::Base

  belongs_to :liked_bookmark, class_name: "Bookmark", foreign_key: "bookmark_id"
  belongs_to :liker, class_name: "User", foreign_key: "user_id"

end
