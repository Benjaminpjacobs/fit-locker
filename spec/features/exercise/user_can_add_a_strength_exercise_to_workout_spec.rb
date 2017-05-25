require 'rails_helper'

RSpec.feature "As a user" do
  before(:all) do
    reset_session!
  end
  
  it "can add strength activity to workout" do
    workout = create(:workout)
    user = workout.user
    CardioActivity.create!(name: "Running")

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
