require 'rails_helper'

RSpec.feature "As a user" do
  before(:all) do
    reset_session!
  end
  
  it "can see all categories" do
    create_list(:muscle_group, 5)
    visit muscle_group_index_path
    expect(page.all('#workouts').count).to eq(6)
    expect(page).to have_content("CARDIO")
  end
end

