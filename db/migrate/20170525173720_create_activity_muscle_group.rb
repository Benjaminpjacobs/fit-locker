class CreateActivityMuscleGroup < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_muscle_groups do |t|
      t.references :muscle_group, foreign_key: true
      t.references :strength_activity, foreign_key: true
    end
  end
end
