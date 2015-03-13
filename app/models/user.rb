class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:idme]

  validates_presence_of :username # Devise won't do this by default.

  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy


  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |u|
      u.provider = auth[:provider]
      u.uid = auth[:uid]
      u.verified = auth[:info][:verified]
      u.affiliation = auth[:info][:affiliation]
    end
  end

  # If using ID.me as SSO, additional info such as email would be available in authorization hash.

  def self.new_with_session(params, session)
    super.tap do |u|
      if data = session["devise.user_attributes"] 
        u.attributes = ActionController::Parameters.new(data)
          .permit(:provider, :uid, :affiliation, :verified)
      end
    end
  end

end






