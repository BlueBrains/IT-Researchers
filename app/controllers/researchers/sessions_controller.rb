class Researchers::SessionsController < Devise::SessionsController
 before_filter :configure_sign_in_params, only: [:create,:destroy]

  # GET /resource/sign_in
  def new
  self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    respond_with(resource, serialize_options(resource), :layout => false)   
  end
  # POST /resource/sign_up
  def create        
    super do |researcher|
      researcher.add_role :researcher
    end         
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) << :username
  end
end
