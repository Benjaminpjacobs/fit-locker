class AddColumnToStrengthExercises < ActiveRecord::Migration[5.1]
  def change
    add_reference :strength_exercises, :workout, foreign_key: true
  end
end
