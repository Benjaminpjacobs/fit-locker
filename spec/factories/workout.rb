FactoryGirl.define do
  factory :workout do
    name {generate(:workout_name)}
    date {generate(:date)}
    category 0
    association :user
  end

  sequence :workout_name do |n|
    "Workout #{n}"
  end
  
  sequence :date do |n|
    Date.today.next_day(n).strftime
  end

end
