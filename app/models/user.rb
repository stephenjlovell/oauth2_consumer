class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:idme]

  validates_presence_of :username # Devise won't do this by default.

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      if auth.info[:affiliation]
        user.affiliation = auth.info[:affiliation]
      end
    end
  end

  # If using ID.me as SSO, additional info such as email would be available in authorization hash.

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.user_attributes"] 
        user.attributes = data
      end
    end
  end

end






