class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

before_action do |controller|               
    :authenticate_researcher! unless ((controller.class == SearchController)||(controller.action_name=="show") ||(controller.class ==  HomeController))
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :notice => exception
  end
  
  protected

  def after_sign_in_path_for(resource)
    researcher_path(current_researcher)
  end
  def after_sign_out_path_for(resource)
    root_path
  end
  def after_sign_up_path_for(resource)
    root_path
  end
end
