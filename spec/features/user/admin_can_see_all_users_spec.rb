require 'rails_helper'

RSpec.feature "As a user" do
  before(:all) do
    reset_session!
  end
  
  it "admin can see all users" do 
    admin = create(:user, role: 1) 
    user1, user2, user3 = create_list(:user, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    
    visit admin_users_path
    save_and_open_page
    expect(page).to have_content("All Users:")
    expect(page).to have_content(user1.email)
    expect(page).to have_content(user2.email)
    expect(page).to have_content(user3.email)
    expect(page).to have_content(admin.email)
  end
end
