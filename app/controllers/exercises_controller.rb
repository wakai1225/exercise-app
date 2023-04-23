class ExercisesController < ApplicationController
  def index
    @exercise = Exercise.new
  end
  
  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.valid?
      @exercise.save
      redirect_to root_path
    else
      render :index
    end
  end
  private
    def exercise_params
      params.require(:exercise).permit(:exercise).merge(user_id: current_user.id)
    end
end
