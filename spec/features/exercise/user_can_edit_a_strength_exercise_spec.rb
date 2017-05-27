require 'rails_helper'

RSpec.feature "As a user" do
  before(:all) do
    reset_session!
  end
  
  it "can edit a strength exercise" do
    activity = create(:strength_activity)
    lift_set = create(:lift_set)
    exercise = lift_set.strength_exercise
    workout = exercise.workout
    user = workout.user
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  
    visit user_workout_path(user, workout)
    expect(page).to_not have_content(activity.name)
    click_on "Edit"
    
    select(activity.name)
    click_on "Update Strength exercise"

    expect(page).to have_content(activity.name)

    click_on "#{activity.name}"
    click_on "Edit"
    fill_in "Reps", with: "20"
    click_on "Update Lift set"
    expect(page).to have_content(20)
  end

  it "throws an error if fields are blank" do
    activity = create(:strength_activity)
    lift_set = create(:lift_set)
    exercise = lift_set.strength_exercise
    workout = exercise.workout
    user = workout.user
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  
    visit user_workout_path(user, workout)
    expect(page).to_not have_content(activity.name)
    click_on "Edit"
    
    select(activity.name)
    click_on "Update Strength exercise"

    expect(page).to have_content(activity.name)

    click_on "#{activity.name}"
    click_on "Edit"
    fill_in "Reps", with: ""
    fill_in "Weight", with: ""
    click_on "Update Lift set"
    expect(page).to have_content("Weight can't be blank")
    expect(page).to have_content("Reps can't be blank")
  end
end

