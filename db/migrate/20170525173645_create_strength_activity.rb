class CreateStrengthActivity < ActiveRecord::Migration[5.1]
  def change
    create_table :strength_activities do |t|
      t.string :name
      t.timestamps
    end
  end
end
