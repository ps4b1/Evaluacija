FactoryBot.define do
  factory :badge_product, class: Spree::BadgeProduct do
    badge {}
    product {}
  end
end
