require 'rails_helper'

RSpec.feature "As a user" do
  before(:all) do
    reset_session!
  end
  
  it "can delete a cardio Exercise" do
    
    exercise = create(:cardio_exercise)
    workout = exercise.workout
    user = workout.user
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_workout_path(user, workout)
    expect(CardioExercise.count).to eq(1)
    click_on "Delete"
    expect(CardioExercise.count).to eq(0)


  end

end

