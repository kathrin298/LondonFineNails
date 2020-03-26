class Product < ApplicationRecord
  belongs_to :category
  validates :name, :price, :sku, :category, presence: true
end
