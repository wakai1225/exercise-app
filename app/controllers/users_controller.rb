class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @urls= exercises_url
  end

end
