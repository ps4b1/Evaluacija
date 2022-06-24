module Spree
  module ProductsControllerDecorator
    def index
    end
  end
end
::Spree::ProductsController.prepend Spree::ProductsControllerDecorator if ::Spree::ProductsController.included_modules.exclude?(Spree::ProductsControllerDecorator)
