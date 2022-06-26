class BadgeProductsController < ApplicationController
  def create
    @badge_products = BadgeProduct.new(product: params[:product], badge: params[:badge])
  end

  def destroy
  end
end
