class WorkoutsController<ApplicationController

  def index
    
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = current_user.workouts.new(workout_params)
    if @workout.save
      redirect_to user_workout_path(current_user, @workout)
    else
      render :new
    end
  end
end