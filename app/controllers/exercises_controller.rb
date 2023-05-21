class ExercisesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to user_path(current_user.id), notice: "Exercises created successfully"
    else
      redirect_to exercises_path(current_user.id)
    end
  end

  # def destroy
  #   @user = User.find(params[:id])
  #   @exercises = @user.exercises
  #    if @exercises.destroy
  #       redirect_to exercises_path(current_user.id)
  #    end
  # end



  private
    def exercise_params
      params.require(:exercise).permit(:url1, :url2, :url3, :url4).merge(user_id: current_user.id)
    end
    
end