class AddUniqueToBadgeName < ActiveRecord::Migration[6.1]
  def change
    change_column :spree_badges, :name, :string, unique: true
  end
end
