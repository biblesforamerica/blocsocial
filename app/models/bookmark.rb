class Bookmark < ActiveRecord::Base
  acts_as_taggable

  belongs_to :user

  has_many :likes

  has_many :likers, through: :likes

end



