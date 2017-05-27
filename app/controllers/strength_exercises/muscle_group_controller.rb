class StrengthExercises::MuscleGroupController < ApplicationController
  def index
    @workout = Workout.find(params[:workout_id])
    @categories = MuscleGroup.order(:name)
  end

  def show
    @category = MuscleGroup.find(params[:id])
    @strength_activities = @category.strength_activities.order(:name)
  end
end