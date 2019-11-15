class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  def after_sign_in_path_for(resource)
      plans_path(resource)
  end

  def after_sign_out_path_for(resource)
      plans_path(resource)
  end

  def configure_permitted_parameters
  	  devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :accepted, :name, :approved, :Image, :photo])
  end

  layout :layout

  private

  def layout
    # only turn it off for login pages:
    
    is_a?(Devise::RegistrationsController) ? false : "application"
    # or turn layout off for every devise controller:
    devise_controller? && "application"
    
  end
end
