require 'rails_helper'

RSpec.feature "As a user" do
  before(:all) do
    reset_session!
  end
  
  it "can edit a cardio exercise" do
    
    exercise = create(:cardio_exercise)
    workout = exercise.workout
    user = workout.user
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_workout_path(user, workout)
    click_on "Edit"
    fill_in "Duration", with: "25:26"
    fill_in "Distance", with: "3.1"
    click_on "Update Cardio exercise"

    expect(page).to have_content(workout.name)
    expect(page).to have_content("25:26")
    expect(page).to have_content("3.1")
  end

  it "throws an error when cardio exercise fields are blank" do

    exercise = create(:cardio_exercise)
    workout = exercise.workout
    user = workout.user
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_workout_path(user, workout)
    click_on "Edit"
    fill_in "Distance", with: ""
    fill_in "Duration", with: ""
    click_on "Update Cardio exercise"

    expect(page).to have_content("Duration can't be blank")
    expect(page).to have_content("Distance can't be blank")
    

  end

end

