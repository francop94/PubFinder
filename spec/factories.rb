FactoryGirl.define do
  
  factory :user do |u|
    
    u.sequence(:email) { |n| "example_#{n}@test.com"}
    u.password "f4k3p455w0rd"
    u.activated true
  end
  
  factory :admin, class: User do
    email  "example@testadmin.com"
    password "f4k3p455w0rd"
    activated true
    admin     true
  end

end
