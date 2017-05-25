require 'rails_helper'

RSpec.describe StrengthActivity do 
  context "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_uniqueness_of(:name)}
    it {should have_many(:activity_muscle_groups)}
    it { should have_many(:muscle_groups).through(:activity_muscle_groups)}
  end
end
