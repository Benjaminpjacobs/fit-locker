class LiftSetsController < ApplicationController
  def new
    @workout  = Workout.find(params[:workout_id])
    @exercise  = StrengthExercise.find(params[:strength_exercise_id])
    @lift_set = LiftSet.new
  end

  def create
    strength_exercise = StrengthExercise.find(params[:strength_exercise_id])
    lift_set = strength_exercise.lift_sets.new(lift_set_params)
    if lift_set.save
      flash[:success] = "Set Added"
      redirect_to user_workout_strength_exercise_path(current_user, strength_exercise.workout, strength_exercise)
    else
      render :new
    end
    
  end

  private

    def lift_set_params
      params.require(:lift_set).permit(:weight, :reps)
    end
    
end