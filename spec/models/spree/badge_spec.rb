require 'rails_helper'

RSpec.describe Spree::Badge, type: :model do
  let(:badge_one){FactoryBot.create(:badge)}
  let(:badge_two){FactoryBot.create(:badge)}
  context 'validation' do
    it 'should be valid' do
      expect(badge_one).to be_valid
    end
    it 'should not be valid without a name' do
      badge_one.name=nil
      expect(badge_one).not_to be_valid
    end
    it 'should not be valid with a ununique name' do
      badge_two.name = badge_one.name
      expect(badge_two).not_to be_valid
    end
  end
  context 'associations' do
    it 'should have many badge_products' do
      should have_many(:badge_products).class_name('Spree::BadgeProduct')
    end
    it 'should have many products through badge_products' do
      should have_many(:products).through(:badge_products).class_name('Spree::Product')
    end
  end
end
