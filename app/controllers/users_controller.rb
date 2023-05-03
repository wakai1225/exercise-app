class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @exercise = @user.exercises
  end

end
