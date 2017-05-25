class CreateStrengthExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :strength_exercises do |t|
      t.references :strength_activity, foreign_key: true
    end
  end
end
