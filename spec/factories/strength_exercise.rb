FactoryGirl.define do
  factory :strength_exercise do
    strength_activity
    workout {create(:workout, category: 1)}
  end
end
