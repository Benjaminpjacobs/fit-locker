require 'rails_helper'

RSpec.feature "As a user" do
  before(:all) do
    reset_session!
  end
  
  context "as a default user "do 
    it "can login" do 
      user = User.create!(email: "Brad@example.com", first_name: "Brad", last_name: "Douglas", password: "Password")

      visit login_path
      fill_in "Email", with: "Brad@example.com"
      fill_in "Password", with: "Password"
      click_button "Login"
      
      click_on "Logout"
      

      expect(page).to_not have_content("Welcome Brad")
      expect(page).to have_content("Logout Successful")
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
    end
  end
end