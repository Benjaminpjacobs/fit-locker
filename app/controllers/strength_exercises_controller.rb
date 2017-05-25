class StrengthExercisesController < ApplicationController
  def new
    @workout = Workout.find(params[:workout_id])
    @strength_exercise = StrengthExercise.new
  end

  def create
    workout = Workout.find(params[:workout_id])
    strength_exercise = workout.strength_exercises.new(strength_params)
    if strength_exercise.save
      flash[:success] = "Exercise Added"
      redirect_to user_workout_strength_exercise_path(workout.user, workout, strength_exercise)
    else
      render :new
    end
  end

  def show
    @workout = Workout.find(params[:workout_id])
    @exercise = StrengthExercise.find(params[:id])
  end

  private

    def strength_params
      params.require(:strength_exercise).permit(:strength_activity_id)
    end
end
