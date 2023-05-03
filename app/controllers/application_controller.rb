class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
    root_path 
  end

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  private
  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: [:patient_id, :birth_date])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:patient_id, :birth_date])
    end

  end
end