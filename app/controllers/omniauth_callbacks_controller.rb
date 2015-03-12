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

  protected

  def auth_hash
    puts request.env["omniauth.auth"].inspect    
    request.env["omniauth.auth"]
  end

end
