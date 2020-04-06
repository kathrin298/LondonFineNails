class ShoppingBag < ApplicationRecord
  belongs_to :user
  has_many :shopping_bag_products
end
