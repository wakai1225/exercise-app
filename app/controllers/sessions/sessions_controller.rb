# frozen_string_literal: true

class Sessions::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def create
    self.resource = warden.authenticate!(auth_options)
    if resource.patient_id == params[:user][:patient_id] && resource.birth_date == Date.parse(params[:user][:birth_date])
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      set_flash_message!(:alert, :invalid)
      redirect_to new_user_session_path
    end
  end

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#new" }.tap do |options|
      options[:patient_id] = sign_in_params[:patient_id]
      options[:birth_date] = sign_in_params[:birth_date]
    end
  end
end
