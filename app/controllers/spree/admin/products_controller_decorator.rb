module Spree
  module Admin
    module ProductsControllerDecorator
      def self.prepended(base)
        base.before_action :set_badges, only: %i[edit]
      end

      private

      def set_badges
        @badges = Spree::Badge.all.sort_by(&:name)
      end
    end
  end
end
if ::Spree::Admin::ProductsController.included_modules.exclude?(Spree::Admin::ProductsControllerDecorator)
  ::Spree::Admin::ProductsController.prepend Spree::Admin::ProductsControllerDecorator
end
