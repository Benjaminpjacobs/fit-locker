require 'rails_helper'

RSpec.feature "As a user" do
  before(:all) do
    reset_session!
  end
  
  it "can add a cardio exercise to workout" do
    workout = create(:workout)
    user = workout.user
    CardioActivity.create!(name: "Running")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_workout_path(user, workout)

    click_on "Add Exercise"
    select "Running"
    fill_in "Duration", with: "25:26"
    fill_in "Distance", with: "3.1"
    click_on "Create Cardio exercise"

    expect(page).to have_content(workout.name)
    expect(page).to have_content("Running")
    expect(page).to have_content("25:26")
    expect(page).to have_content("3.1")
  end

    
  it "can throws an error if missing field to workout" do
    workout = create(:workout)
    user = workout.user
    CardioActivity.create!(name: "Running")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_workout_path(user, workout)

    click_on "Add Exercise"
    select "Running"
    fill_in "Distance", with: "3.1"
    click_on "Create Cardio exercise"
    expect(page).to have_content("Duration can't be blank")

    visit user_workout_path(user, workout)
    click_on "Add Exercise"
    select "Running"
    fill_in "Duration", with: "10:00"
    click_on "Create Cardio exercise"
    expect(page).to have_content("Distance can't be blank")
  end
end
