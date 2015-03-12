class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def idme
    user = User.from_omniauth(auth_hash)
    if user.persisted?
      # flash[:notice] = "Signed in."
      sign_in_and_redirect user
    else
      # persist attributes in session so validation errors can be displayed if needed.
      # devise will remove the attributes later when the session is destroyed.
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  protected

  def auth_hash
    request.env["omniauth.auth"]
  end

end
