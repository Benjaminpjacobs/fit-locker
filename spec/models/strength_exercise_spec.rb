require 'rails_helper'

RSpec.describe StrengthExercise do 
  context "validations" do
    it {should belong_to(:strength_activity)}
    # it {should have_many(:lift_sets)}
  end
end
