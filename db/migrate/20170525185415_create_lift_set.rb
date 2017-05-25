class CreateLiftSet < ActiveRecord::Migration[5.1]
  def change
    create_table :lift_sets do |t|
      t.float :weight
      t.integer :reps
      t.references :strength_exercise, foreign_key: true
      t.timestamps
    end
  end
end
