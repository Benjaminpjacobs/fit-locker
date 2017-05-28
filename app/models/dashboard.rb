class Dashboard < ApplicationRecord
  def self.number_of_days_active(id)
    Workout.where(user_id: id).distinct.pluck(:date).count
  end
  
  def total_strength_workouts(id)
    Workout.where(user_id: id).where(category: 1).count
  end
  
  def total_cardio_workouts(id)
    Workout.where(user_id: id).where(category: 0).count
  end
  
  def total_mileage(id)
    Workout.where(user_id: id).joins(:cardio_exercises).sum(:distance)
  end


  def average_mileage
    Workout.where(user_id: id).joins(:cardio_exercises).average(:distance)
  end
  
  def most_popular_activity(id)
    ids = Workout.where(user_id: id).pluck(:id)
    CardioExercise.joins(:cardio_activity).where(workout_id: ids).group(:name).count(:name)
    StrengthExercise.joins(:strength_activity).where(workout_id: ids).group(:name).count(:name)
  end
  
end