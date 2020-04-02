class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :photo
  validates :name, :price, :sku, :category, presence: true
end
