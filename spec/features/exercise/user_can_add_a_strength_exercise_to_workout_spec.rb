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
    click_on "Add Exercise"
    expect(page).to have_content("Bench Press")
   
    click_on "Add Set"
    fill_in "Weight", with: "125"
    fill_in "Reps", with: "10"
    click_on "Add Set"
    save_and_open_page
    expect(page).to have_content("Bench Press")
    expect(page).to have_content("125.0 lbs")
  end

end


# As A user
# When I’m on a workout show page
# And the workout is a strength workout
# And I click add exercise
# I’m taken to the new workout strength exercise page

# As a user
# When I’m on the new workout strength exercise page
# And I fill out the type
# And I click add exercise
# I’m taken to the workout_exercise_show page
# And I can see my exercise
# And I click on add set
# And I’m taken to the new strength set page
# And I fill in the weight
# And I fill in the reps
# And I click submit set
# I’m taken to the workout exercise show page
# And I can see my exercise and set
# And I can click on workout
# And I’m taken to the workout show page
# And I can see my exercises and sets and reps
