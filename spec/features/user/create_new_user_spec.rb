require 'rails_helper'

RSpec.feature "As a user" do
  before(:all) do
    reset_session!
  end
  
  it "can create new user" do 
    visit new_user_path

    fill_in "Email", with: "Brad@example.com"
    fill_in "First name", with: "Brad"
    fill_in "Last name", with: "Douglas"
    fill_in "Password", with: "Password"
    click_button "Create User"
    expect(page).to have_content("Welcome Brad")
    expect(page).to have_content("User Successfully Created")

  end

  it "throws an error for missing fields" do 
    visit new_user_path

    click_button "Create User"
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Password can't be blank")

  end
end
