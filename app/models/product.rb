class Product < ApplicationRecord
  belongs_to :category
  belongs_to :color
  has_many :shopping_bag_products, dependent: :destroy
  has_one_attached :photo
  validates :name, :price, :sku, :category, presence: true
end
