class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    fbhash = request.env["omniauth.auth"]
    @user = User.find_for_facebook_oauth(fbhash)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
    
  end

end
