FactoryGirl.define do
  factory :muscle_group do
    name {generate(:muscle_group_name)}
  end

  sequence :muscle_group_name do |n|
    "Muscle Group #{n}"
  end
  
end