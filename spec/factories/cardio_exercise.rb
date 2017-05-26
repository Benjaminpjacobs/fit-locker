FactoryGirl.define do
  factory :cardio_exercise do
    duration
    distance
    cardio_activity
    workout
  end

  sequence :duration do |n|
    n
  end

  sequence :distance do |n|
    n
  end

end
