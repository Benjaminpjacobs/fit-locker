class CardioActivityController < ApplicationController
  def index
    @cardio_activities = CardioActivity.order(:name)
  end
end