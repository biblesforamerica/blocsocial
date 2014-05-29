class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, :omniauth_providers => [:facebook]


  has_many :bookmarks  #as an owner
  has_many :likes, dependent: :destroy

  has_many :liked_bookmarks, through: :likes

  def my_hashes
    @tags = []
    self.bookmarks.all.collect{|bookmark| @tags << bookmark.tag_list }
    @tags
  end

  def like(bookmark)
    self.liked_bookmarks << bookmark
  end

  def unlike(bookmark)
    self.liked_bookmarks.delete(bookmark)
  end

  def self.find_for_facebook_oauth(auth)
        where(auth.slice(:provider, :uid)).first_or_create do |user|
          user.provider = auth.provider
          user.uid = auth.uid
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
        #  user.name = auth.info.name   # assuming the user model has a name
        #  user.image = auth.info.image # assuming the user model has an image
    end
  end



end
