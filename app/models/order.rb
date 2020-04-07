class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products

  def amount
    total = 0
    self.order_products.each do |o_product|
      total += o_product.quantity * o_product.product.price
    end
    total
  end
end
