require 'rails_helper'

RSpec.describe Spree::BadgeProduct, type: :model do
  let(:badge_one){FactoryBot.create(:badge)}
  let(:product_one){FactoryBot.create(:product)}
  let(:badge_product_one){FactoryBot.create(:badge_product, badge: badge_one, product: product_one)}
  context 'validation' do
    it 'should be valid' do
      expect(badge_product_one).to be_valid
    end
    it 'should not be valid without a product' do
      badge_product_one.product=nil
      expect(badge_product_one).not_to be_valid
    end
    it 'should not be valid without a badge' do
      badge_product_one.badge=nil
      expect(badge_product_one).not_to be_valid
    end
  end
  context 'association' do
    it 'should belong to product' do
      should belong_to(:product).class_name('Spree::Product')
    end
    it 'should belong to badge' do
      should belong_to(:badge).class_name('Spree::Badge')
    end
  end
end
