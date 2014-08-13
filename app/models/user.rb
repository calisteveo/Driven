class User < ActiveRecord::Base
  has_many :programs
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :fb_id)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.fb_id = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
