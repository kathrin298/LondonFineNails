class CreateShoppingBagProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_bag_products do |t|
      t.references :product, foreign_key: true
      t.integer :quantity, default: 1
      t.references :shopping_bag, foreign_key: true

      t.timestamps
    end
  end
end
