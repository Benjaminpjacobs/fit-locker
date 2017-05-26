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

  def edit
    @workout = Workout.find(params[:workout_id])
    @cardio_exercise = CardioExercise.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:workout_id])
    @cardio_exercise = CardioExercise.find(params[:id])
    @cardio_exercise.update(cardio_params)
    if @cardio_exercise.save
      flash[:success] = "Exercise updated!"
      redirect_to user_workout_path(current_user, @workout)
    else
      render :edit
    end
  end

  def destroy
    @workout = Workout.find(params[:workout_id])
    @cardio_exercise = CardioExercise.find(params[:id])
    @cardio_exercise.destroy
    redirect_to user_workout_path(current_user, @workout)
  end

  private

    def cardio_params
      params.require(:cardio_exercise).permit(:duration, :distance, :cardio_activity_id)
    end
end
