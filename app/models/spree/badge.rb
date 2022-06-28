module Spree
  class Badge < ApplicationRecord
    has_many :badge_products, class_name: 'Spree::BadgeProduct', dependent: :destroy
    has_many :products, class_name: 'Spree::Product', through: :badge_products
  end
end
