class Researchers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  skip_before_filter :authenticate_user!
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth
  #google+ callback
  def gplus
    byebug
    @researcher = Researcher.from_omniauth(request.env["omniauth.auth"])

    if @researcher.persisted?
      sign_in_and_redirect @researcher, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Google+") if is_navigational_format?
    else
      session["devise.gplus_data"] = request.env["omniauth.auth"]
      redirect_to new_researcher_registration_url
    end
  end
  # GET|POST /resource/auth/twitter
  def passthru
    byebug
    super
  end

  # GET|POST /users/auth/twitter/callback
  def failure
    byebug
    super
  end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
