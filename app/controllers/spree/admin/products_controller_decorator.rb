module Spree
  module ProductsControllerDecorator
    def test
    end
  end
end
::Spree::Admin::ProductsController.prepend Spree::ProductsControllerDecorator if ::Spree::Admin::ProductsController.included_modules.exclude?(Spree::ProductsControllerDecorator)
