class StrengthExercisesController < ApplicationController
  before_action :set_workout
  before_action :set_strength_exercise, only: [:show, :edit, :update, :destroy]

  def new
    @strength_exercise = StrengthExercise.new(strength_activity_id: params[:activity_id])
  end

  def create
    strength_exercise = @workout.strength_exercises.new(strength_params)
    if strength_exercise.save
      flash[:success] = "Exercise Added"
      redirect_to user_workout_strength_exercise_path(@workout.user, @workout, strength_exercise)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @strength_exercise.update(strength_params)
    if @strength_exercise.save
      flash[:success] = "Exercise updated!"
      redirect_to user_workout_path(current_user, @workout)
    else
      render :edit
    end
  end

  def destroy
    @strength_exercise.destroy
    redirect_to user_workout_path(current_user, @workout)
  end

  private

    def strength_params
      params.require(:strength_exercise).permit(:strength_activity_id)
    end

    def set_workout
      @workout = Workout.find(params[:workout_id])
    end
    
    def set_strength_exercise
      @strength_exercise = StrengthExercise.find(params[:id])
    end
end
