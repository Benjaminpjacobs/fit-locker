require 'rails_helper'

RSpec.feature "As a user" do
  before(:all) do
    reset_session!
  end
  
  it "can delete a strength exercise" do
    lift_set = create(:lift_set)
    exercise = lift_set.strength_exercise
    lift_set = create(:lift_set,  strength_exercise: exercise)
    workout = exercise.workout
    user = workout.user
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  
    visit user_workout_path(user, workout)
    click_on "#{exercise.strength_activity.name}"
    expect(LiftSet.count).to eq(2)
    first(".list-group-item-text").click_on("Delete")
    expect(LiftSet.count).to eq(1)
    
    visit user_workout_path(user, workout)
    expect(StrengthExercise.count).to eq(1)
    click_on "Delete"
    expect(StrengthExercise.count).to eq(0)

  end

end

