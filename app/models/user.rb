class User < ActiveRecord::Base
  has_many :programs
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :fb_id)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.fb_id = auth.uid
      user.name = auth.info.name
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.fb_pic_url = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
