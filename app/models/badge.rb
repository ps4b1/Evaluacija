class Badge < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :badge_products, foreign_key: 'badge_id', dependent: :destroy
  has_many :products, class_name: 'Spree::Product', through: :badge_products
end
