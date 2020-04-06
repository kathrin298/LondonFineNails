class CreateShoppingBags < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_bags do |t|
      t.references :user, foreign_key: true
      t.integer :total_amount
      t.integer :total_items

      t.timestamps
    end
  end
end
