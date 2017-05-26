FactoryGirl.define do
  factory :cardio_activity do
    name {generate(:activity)}
  end

  sequence :activity do |n|
    "Activity #{n}"
  end

end
