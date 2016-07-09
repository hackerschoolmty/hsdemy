FactoryGirl.define do
  factory :course do
    name { ["Rubu 101", "Rails 101", "API's 101", "Patterns 101"].sample }
    limit { rand(2..30) }
  end
end
