FactoryGirl.define do
  factory :strength_activity do
    name {generate(:strength_activity)}
  end

  sequence :strength_activity do |n|
    "Acitivty #{n}"
  end
  
end

