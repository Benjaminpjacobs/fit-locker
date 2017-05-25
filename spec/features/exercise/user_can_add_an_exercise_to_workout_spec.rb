require 'rails_helper'

RSpec.feature "As a user" do
  before(:all) do
    reset_session!
  end
  
  it "can add to workout" do
    workout = create(:workout)
    user = workout.user
    CardioActivity.create!(name: "Running")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_workout_path(user, workout)
    click_on "Add Exercise"
    select "Running"
    fill_in "Duration", with: "25:26"
    fill_in "Distance", with: "3.1"
    click_on "Add Exercise"

    expect(page).to have_content(workout.name)
    expect(page).to have_content("Running")
    expect(page).to have_content("25:26")
    expect(page).to have_content("3.1")
  end

end


# As A user
# When I’m on a workout show page
# And the workout is a cardio workout
# And I click add exercise
# I’m taken to the new cardio exercise page

# As a user
# When I’m on the new cardio exercise page
# And I fill out duration
# And I fill out distance
# And I select exercise
# And I click add exercise
# I’m taken to the workout show page
# And I can see my exercise