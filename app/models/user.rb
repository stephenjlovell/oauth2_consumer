class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:idme]

  validates_presence_of :username # Devise won't do this by default.

  def self.from_omniauth(auth)
    puts auth.inspect
    # puts auth.slice(:provider, :uid).inspect
    where(auth.slice(:provider, :uid)).first_or_create do |u|
      u.provider = auth.provider
      u.uid = auth.uid
      if auth[:info][:verified]
        u.affiliation = auth.info[:affiliation]
      end
    end
  end

  # If using ID.me as SSO, additional info such as email would be available in authorization hash.

  def self.new_with_session(params, session)
    super.tap do |u|
      if data = session["devise.user_attributes"] 
        u.attributes = data
      end
    end
  end

end






