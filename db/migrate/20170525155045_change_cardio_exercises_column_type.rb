class ChangeCardioExercisesColumnType < ActiveRecord::Migration[5.1]
  def change
    change_column :cardio_exercises, :duration, :string

  end
end
