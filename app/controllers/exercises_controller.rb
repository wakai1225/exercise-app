class ExercisesController < ApplicationController
  def index
    @exercise = Exercise.new

  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to user_path(current_user.id), notice: "Exercises created successfully"
    else
      render :index
    end
  end

  private
    def exercise_params
      params.require(:exercise).permit(:url1, :url2, :url3, :url4).merge(user_id: current_user.id)
    end
    
end