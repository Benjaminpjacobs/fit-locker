require 'rails_helper'

RSpec.describe ActivityMuscleGroup do 
  context "validations" do
    it { should belong_to(:muscle_group)}
    it { should belong_to(:strength_activity)}
  end
end
