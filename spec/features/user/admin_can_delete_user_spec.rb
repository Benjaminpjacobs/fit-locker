require 'rails_helper'

RSpec.feature "As a user" do
  before(:all) do
    reset_session!
  end
  
  it "admin can see all users" do 
    admin = create(:user, role: 1) 
    user1 = create(:user)
    create_list(:workout, 3, user: user1)
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    
    visit admin_users_path
    expect(User.count).to eq(2)
    page.all("#delete")[1].click_link("Delete")
    expect(User.count).to eq(1)
    expect(page).to_not have_content(user1.email)
  end
end
