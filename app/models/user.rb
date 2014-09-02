class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  has_many :programs
  
  def self.from_omniauth(auth)
    user = User.find_by(:fb_id => auth.uid)  
    user || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
        user.provider = auth.provider
        user.fb_id = auth.uid
        user.name = auth.info.name
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.email = auth.info.email
        user.fb_pic_url = auth.info.image
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    end
  end
end
