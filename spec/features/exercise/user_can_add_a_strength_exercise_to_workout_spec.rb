require 'rails_helper'

RSpec.feature "As a user" do
  before(:all) do
    reset_session!
  end
  
  it "can add strength activity to workout" do
    workout = create(:workout, category: 1)
    user = workout.user
    StrengthActivity.create!(name: "Bench Press")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_workout_path(user, workout)
    click_on "Add Exercise"
    
    select "Bench Press"
    click_on "Create Strength exercise"
    expect(page).to have_content("Bench Press")
    click_on "Add Set"
    fill_in "Weight", with: "125"
    fill_in "Reps", with: "10"
    click_on "Create Lift set"

    expect(page).to have_content("Bench Press")
    expect(page).to have_content("125.0 lbs")
  end

  it "throws an error when fields are missing" do
    workout = create(:workout, category: 1)
    user = workout.user
    StrengthActivity.create!(name: "Bench Press")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_workout_path(user, workout)
    click_on "Add Exercise"
    
    select "Bench Press"
    click_on "Create Strength exercise"
    expect(page).to have_content("Bench Press")
    click_on "Add Set"
    fill_in "Reps", with: "10"
    click_on "Create Lift set"

    expect(page).to have_content("Weight can't be blank")
    fill_in "Weight", with: "125"
    fill_in "Reps", with: ""
    click_on "Create Lift set"

    expect(page).to have_content("Reps can't be blank")
  end

end

