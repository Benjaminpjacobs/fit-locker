class WorkoutsController<ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = current_user.workouts
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

  def show
  end

  def edit
  end

  def update
    @workout.update(workout_params)
    if @workout.save
      flash[:success] = "#{@workout.name} udated!"
      redirect_to user_workouts_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @workout.destroy
    redirect_to user_workouts_path(current_user)
  end

    private

    def workout_params
      result = params.require(:workout).permit(:name, :date, :category)
      result[:category] = result[:category].to_i
      result
    end

    def set_workout
      @workout = Workout.find(params[:id])
    end
end