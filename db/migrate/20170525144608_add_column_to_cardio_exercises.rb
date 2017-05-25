class AddColumnToCardioExercises < ActiveRecord::Migration[5.1]
  def change
    add_reference :cardio_exercises, :workout, foreign_key: true
  end
end
