# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params,  if: :devise_controller?

  # GET /resource/sign_in
  # def new
  #   super
  # end

  
  # POST /resource/sign_in
   def create
    @user = User.find_by(patient_id: params[:user][:patient_id])
    if @user.birth_date == params[:user][:birth_date]
      sign_in(@user)
      redirect_to user_path(current_user.id)
    end

   end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

 protected

   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:patient_id, :birth_date])
   end
end
