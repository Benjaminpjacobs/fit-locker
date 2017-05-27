require 'rails_helper'

RSpec.feature "As a user" do
  before(:all) do
    reset_session!
  end
  
  it "can add strength exercise from categories" do
    workout = create(:workout, category: "strength")
    user = workout.user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    mg = create(:muscle_group)
    sa = create(:strength_activity, name: 'Pushup')
    mg.strength_activities.push(sa)
    

    visit user_workout_path(user, workout)
    click_on "Browse Exercises"
    click_on "#{mg.name.upcase}"
    click_on "Add to Workout"
    
    expect(page).to have_content("#{sa.name}")
  end
  

  it "can add strength exercise from categories" do
    workout = create(:workout)
    user = workout.user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    sa = create(:cardio_activity, name: 'Running')
    
    

    visit user_workout_path(user, workout)
    click_on "Browse Exercises"
    click_on "Add to Workout"
    
    expect(page).to have_content("#{sa.name}")
  end
end
