require 'rails_helper'

RSpec.feature "As a user" do
  before(:all) do
    reset_session!
  end
  
  it "admin can edit users" do 
    admin = create(:user, role: 1) 
    user1 = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    
    visit admin_users_path
    page.all("#edit")[1].click_link("Edit")
    fill_in "Last name", with: "Smith"
    click_on "Update User"
    expect(page).to have_content("Smith")
  end

  it "throws am error if blank field" do 
    admin = create(:user, role: 1) 
    user1 = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    
    visit admin_users_path
    page.all("#edit")[1].click_link("Edit")
    fill_in "Last name", with: ""
    click_on "Update User"
    expect(page).to have_content("Last name can't be blank")
  end
end
