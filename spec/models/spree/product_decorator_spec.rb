require 'rails_helper'
RSpec.describe Spree::Product, type: :model do
  context 'associations' do
    it 'should have many badge_products' do
      should have_many(:badge_products).class_name('Spree::BadgeProduct')
    end
    it 'should have many badges through badge_products' do
      should have_many(:badges).through(:badge_products).class_name('Spree::Badge')
    end
  end
end
