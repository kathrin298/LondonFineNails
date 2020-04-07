class ShoppingBag < ApplicationRecord
  belongs_to :user
  has_many :shopping_bag_products, dependent: :destroy

  def total_amount
    total = 0
    self.shopping_bag_products.each do |sh_product|
      total += sh_product.quantity * sh_product.product.price
    end
    total
  end

  def total_items
    count = 0
    self.shopping_bag_products.each { |sh_product| count += sh_product.quantity }
    count
  end
end
