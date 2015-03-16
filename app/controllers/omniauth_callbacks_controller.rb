class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def idme
    @user = User.from_omniauth(auth_hash)
    if @user.persisted?

      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: "ID.me") if is_navigational_format?
    else
      # persist attributes in session so validation errors can be displayed if needed.
      # devise will remove the attributes later when the session is destroyed.
      session["devise.user_attributes"] = @user.attributes
      redirect_to new_user_registration_url
    end
  end

  def auth_hash
    auth = request.env["omniauth.auth"]
    # persist raw response in session to display to user when signed in.
    # devise will remove the hash later when the session is destroyed.
    session["devise.omniauth_raw"] = auth[:extra][:raw] || auth || ''
    ActionController::Parameters.new(auth)
      .permit(:provider, :uid, info: [:affiliation, :verified])
  end
  protected :auth_hash


end
