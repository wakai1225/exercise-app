

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, if: :devise_controller?
  def create
    Rails.logger.info("params: #{params.inspect}")
    existing_user = User.find_by(patient_id: params[:user][:patient_id], birth_date: Date.parse(params[:user][:birth_date]))
    if existing_user
      self.resource = existing_user
      update_resource(resource, sign_up_params)
      set_flash_message!(:notice, :updated)
      yield resource if block_given?
      respond_with resource, location: after_update_path_for(resource)
    else
      binding.pry
      build_resource(configure_sign_up_params)
      if resource.save
        set_flash_message!(:notice, :signed_up)
        sign_up(resource_name, resource)
        yield resource if block_given?
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end
  end
  

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#new" }.tap do |options|
      options[:patient_id] = sign_up_params[:patient_id]
      options[:birth_date] = sign_up_params[:birth_date]
    end
  end
  
  
  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:patient_id, :birth_date])
  end
  
end
