class CreateCardioExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :cardio_exercises do |t|
      t.integer :duration
      t.float :distance
      t.references :cardio_activity, foreign_key: true
    end
  end
end
