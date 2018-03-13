class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
    :recoverable, :rememberable, :trackable, :validatable

  def self.from_omniauth(auth)
    where(email: auth.info.email, provider: auth.provider).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.instance_url = auth.credentials.instance_url
      user.oauth_token = auth.credentials.token
      user.refresh_token = auth.credentials.refresh_token
      user.save!
    end
  end
end
