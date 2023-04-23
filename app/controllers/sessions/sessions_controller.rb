# frozen_string_literal: true

class Sessions::SessionsController < Devise::SessionsController


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
