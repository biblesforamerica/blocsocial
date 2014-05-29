class Bookmark < ActiveRecord::Base
  acts_as_taggable

  belongs_to :user

  has_many :likes, dependent: :destroy

  has_many :likers, through: :likes


  def numlikes
    self.likes.size
  end


end



