class CardioExercisesController < ApplicationController
  def new
    @workout = Workout.find(params[:workout_id])
    @cardio_exercise = CardioExercise.new
  end

  def create
    workout = Workout.find(params[:workout_id])
    cardio_exercise = workout.cardio_exercises.new(cardio_params)
    if cardio_exercise.save
      flash[:success] = "Exercise Added"
      redirect_to user_workout_path(workout.user, workout)
    else
      render :new
    end
  end

  private

    def cardio_params
      params.require(:cardio_exercise).permit(:duration, :distance, :cardio_activity_id)
    end
end
