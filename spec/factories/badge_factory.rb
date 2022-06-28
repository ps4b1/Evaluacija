FactoryBot.define do
  factory :badge, class: Spree::Badge do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "User+#{n}" }
  end
end
