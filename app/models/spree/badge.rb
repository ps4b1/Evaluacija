module Spree
  class Badge < ApplicationRecord
    validates :name, uniqueness: true, presence: true
    has_many :badge_products, class_name: 'Spree::BadgeProduct', dependent: :destroy
    has_many :products, class_name: 'Spree::Product', through: :badge_products
  end
end
