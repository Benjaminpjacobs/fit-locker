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

    expect(Workout.all.count).to eq(1)
    click_on "Delete"

    expect(Workout.all.count).to eq(0)

  end
end
