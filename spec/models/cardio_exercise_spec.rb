require 'rails_helper'

RSpec.describe CardioExercise do 
  context "validations" do
    it {should validate_presence_of(:duration)}
    it {should validate_presence_of(:distance)}
    it {should belong_to(:workout)}
    it {should belong_to(:cardio_activity)}
  end
end
