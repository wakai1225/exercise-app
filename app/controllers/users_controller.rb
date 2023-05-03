class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @exercises = @user.exercises
  end
end
