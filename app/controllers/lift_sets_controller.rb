class LiftSetsController < ApplicationController
  before_action :set_workout
  before_action :set_strength_exercise
  before_action :set_lift_set, only: [:edit, :update, :destroy]
  
  def new
    @lift_set = LiftSet.new
  end

  def create
    @lift_set = @exercise.lift_sets.new(lift_set_params)
    if @lift_set.save
      flash[:success] = "Set Added"
      redirect_to user_workout_strength_exercise_path(current_user, @workout, @exercise)
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    @lift_set.update(lift_set_params)
    if @lift_set.save
      flash[:success] = "Exercise updated!"
      redirect_to user_workout_strength_exercise_path(current_user, @workout, @exercise)
    else
      render :edit
    end
  end

  def destroy
    @lift_set.destroy
    redirect_to user_workout_strength_exercise_path(current_user, @workout, @exercise)
  end

  private

    def lift_set_params
      params.require(:lift_set).permit(:weight, :reps)
    end
    
    def set_workout
      @workout = Workout.find(params[:workout_id])
    end

    def set_lift_set
      @lift_set = LiftSet.find(params[:id])
    end

    def set_strength_exercise
      @exercise = StrengthExercise.find(params[:strength_exercise_id])
    end
end