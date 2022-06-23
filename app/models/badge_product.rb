class BadgeProduct < ApplicationRecord
  belongs_to :badge
  belongs_to :product, class_name: 'Spree::Product'
end
