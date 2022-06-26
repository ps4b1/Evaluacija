module Spree
  module ProductDecorator
    def self.prepended(base)
      base.has_many :badge_products, class_name: 'BadgeProduct', foreign_key: 'product_id', dependent: :destroy
      base.has_many :badges, class_name: 'Spree::Badge', through: :badge_products
    end
  end
end
::Spree::Product.prepend Spree::ProductDecorator if ::Spree::Product.included_modules.exclude?(Spree::ProductDecorator)
