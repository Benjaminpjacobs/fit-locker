class DashboardController < ApplicationController
  def index
    @activities = CardioActivity.all.map{|activity| activity.name}
    # binding.pry
  end
end