class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :sku
      t.string :size
      t.string :color
      t.boolean :available, default: true
      t.float :price
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
