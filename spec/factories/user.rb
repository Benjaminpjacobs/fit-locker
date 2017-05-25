FactoryGirl.define do
  factory :user do
    email
    first_name 
    last_name  
    password
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :first_name do |n|
    "Joe#{n}"
  end

  sequence :last_name do |n|
    "Smith#{n}"
  end


  sequence :password do |n|
    "password#{n}"
  end

end
