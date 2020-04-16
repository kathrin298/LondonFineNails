class Color < ApplicationRecord
  has_many :products
  validates :name, :color_code, presence: true
end
