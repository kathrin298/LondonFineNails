class ShoppingBagsController < ApplicationController
  before_action :find_shopping_bag

  def show
    @products_in_bag = {}
    @shopping_bag.shopping_bag_products.each { |sh_product| @products_in_bag[sh_product.product] = sh_product.quantity}
  end

  private

  def find_shopping_bag
    @shopping_bag = current_user.shopping_bag
  end
end
