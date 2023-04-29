class ExercisesController < ApplicationController
  def index
    @exercise = Exercise.new
  end
  
  def create
    @exercise = Exercise.create(exercise_params)
    if @exercise.save
      redirect_to action: show
    else
      render :index
    end
  end

  def show
  end
  

  private
  def exercise_params
    params.require(:exercise).permit(:exercise).merge(user_id: current_user.id)
  end
end
