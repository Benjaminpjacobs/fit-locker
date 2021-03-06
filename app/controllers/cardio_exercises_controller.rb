class CardioExercisesController < ApplicationController
  before_action :set_workout
  before_action :set_cardio_exercise, only: [:edit, :update, :destroy]

  def new
    @cardio_exercise = CardioExercise.new(cardio_activity_id: params[:activity_id])
  end

  def create
    @cardio_exercise = @workout.cardio_exercises.new(cardio_params)
    if @cardio_exercise.save
      flash[:success] = "Exercise Added"
      redirect_to user_workout_path(@workout.user, @workout)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @cardio_exercise.update(cardio_params)
    if @cardio_exercise.save
      flash[:success] = "Exercise updated!"
      redirect_to user_workout_path(current_user, @workout)
    else
      render :edit
    end
  end

  def destroy
    @cardio_exercise.destroy
    redirect_to user_workout_path(current_user, @workout)
  end

  private

    def cardio_params
      params.require(:cardio_exercise).permit(:duration, :distance, :cardio_activity_id)
    end

    def set_workout
      @workout = Workout.find(params[:workout_id])
    end

    def set_cardio_exercise
      @cardio_exercise = CardioExercise.find(params[:id])
    end
end
