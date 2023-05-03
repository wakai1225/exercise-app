class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @urls= @user.exercises_url
  end

end
