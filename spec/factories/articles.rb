FactoryGirl.define do
  factory :article do
    sequence(:name, 1) { |n| "Name#{n}" }
    sequence(:content, 1) { |n| "Content#{n}" }
  end
end
