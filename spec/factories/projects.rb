FactoryGirl.define do
  factory :project do
    sequence(:name, 1) { |n| "Name#{n}" }
    sequence(:description, 1) { |n| "Description#{n}" }
    sequence(:link, 1) { |n| "Link#{n}"}
  end
end
