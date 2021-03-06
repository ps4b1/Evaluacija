class CreateBadgeProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_badge_products do |t|
      t.references :product, null: false, foreign_key: { to_table: :spree_products}
      t.references :badge, null: false, foreign_key: { to_table: :spree_badges}

      t.timestamps
    end
    add_index :spree_badge_products, %i[product_id badge_id],unique: true
  end
end
