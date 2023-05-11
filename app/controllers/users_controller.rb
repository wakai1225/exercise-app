class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  def show
    @user = User.find(params[:id])
    @exercises = @user.exercises
  end

  # def destroy
  #   @user = User.find(params[:id])
  #   @exercises = @user.exercises
  #   if @exercises.destroy
  #     redirect_to redirect_to exercises_path(current_user.id)
  #   end
  # end
end

