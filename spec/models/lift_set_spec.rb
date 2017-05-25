require 'rails_helper'

RSpec.describe LiftSet do 
  context "validations" do
    it {should validate_presence_of(:weight)}
    it {should validate_presence_of(:reps)}
    it {should belong_to(:strength_exercise)}
  end
end
