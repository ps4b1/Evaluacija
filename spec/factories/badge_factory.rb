FactoryBot.define do
  factory :badge, class: Spree::Badge do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "Badge#{n}" }
  end
end
