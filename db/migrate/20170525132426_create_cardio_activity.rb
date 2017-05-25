class CreateCardioActivity < ActiveRecord::Migration[5.1]
  def change
    create_table :cardio_activities do |t|
      t.string :name
      t.timestamps
    end
  end
end
