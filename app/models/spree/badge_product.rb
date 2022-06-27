module Spree
  class BadgeProduct < ApplicationRecord
    belongs_to :badge, class_name: 'Spree::Badge'
    belongs_to :product, class_name: 'Spree::Product'
  end
end
