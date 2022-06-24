module MyStore
  module Spree
    module ProductsControllerDecorator
      def some_action
      end
    end
  end
end
::Spree::ProductsController.prepend MyStore::Spree::ProductsControllerDecorator if ::Spree::ProductsController.included_modules.exclude?(MyStore::Spree::ProductsControllerDecorator)
