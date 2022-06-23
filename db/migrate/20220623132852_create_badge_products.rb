class CreateBadgeProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :badge_products do |t|
      t.references :product, null: false, foreign_key: { to_table: :spree_products}
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
    add_index :badge_products, %i[product_id badge_id],unique: true
  end
end
