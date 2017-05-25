require 'rails_helper'

RSpec.describe CardioActivity do 
  context "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_uniqueness_of(:name)}
    it {should have_many(:cardio_exercises)}
  end
end
