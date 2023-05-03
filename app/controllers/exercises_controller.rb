class ExercisesController < ApplicationController
  def index
    @exercise = Exercise.new
  end
  
  def create
    @exercise = Exercise.create(exercise_params)
    if @exercise.save
      redirect_to user_path(current_user.id)

    else
    @exercise.errors.full_messages.join(", ")
    render :create
    end
  end



  private
  def exercise_params
    params.require(:exercise).permit(:exercise).merge(user_id: current_user.id)
  end
end
