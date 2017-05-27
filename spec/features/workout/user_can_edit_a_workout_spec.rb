require 'rails_helper'

RSpec.feature "As a user" do
  before(:all) do
    reset_session!
  end
  
  it "can create workout" do
    user = create(:user) 
    workout = create(:workout, user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_workouts_path(user)
    click_link "Edit"
    fill_in "Name", with: "Workout 2"
    click_on "Update Workout"

    expect(page).to have_content("Workout 2")
    expect(page).to have_content("Cardio")
  end

    
  it "throws an error if fields are blank" do
    user = create(:user) 
    workout = create(:workout, user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_workouts_path(user)
    click_link "Edit"
    fill_in "Name", with: ""
    click_on "Update Workout"

    expect(page).to have_content("Name can't be blank")
  end
end
