FactoryGirl.define do
  factory :student do
    name { FFaker::Name.name }
  end
end
