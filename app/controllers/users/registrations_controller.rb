class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, if: :devise_controller?

 
  private
  def configure_sign_up_params
    binding.pry
    devise_parameter_sanitizer.permit(:sign_up, keys: [:patient_id, :birth_date])
  end
  
end
