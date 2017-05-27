class MuscleGroupController < ApplicationController
  def index
    @categories = MuscleGroup.order(:name)
  end

  def show
    @category = MuscleGroup.find(params[:id])
    @strength_activities = @category.strength_activities.order(:name)
  end
end