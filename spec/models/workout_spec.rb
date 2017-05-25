require 'rails_helper'

RSpec.describe Workout do 
  context "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:date)}
    it {should validate_presence_of(:category)}
    it {should belong_to(:user)}
  end
end
