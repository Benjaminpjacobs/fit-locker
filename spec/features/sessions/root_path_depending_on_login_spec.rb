require 'rails_helper'

RSpec.feature "When visiting root" do
  before(:all) do
    reset_session!
  end
  
  context "if logged in "do 
    it "see dashboard" do 
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      
      visit root_path
      expect(current_path).to eq(user_dashboard_index_path(user))
    end
  end

  context "if not logged in "do 
    it "see login page" do 
      user = create(:user)
      
      visit root_path
      expect(current_path).to eq(login_path)
    end
  end
end
