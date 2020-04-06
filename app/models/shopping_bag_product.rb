class ShoppingBagProduct < ApplicationRecord
  belongs_to :product
  belongs_to :shopping_bag
end
