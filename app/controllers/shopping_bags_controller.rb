class ShoppingBagsController < ApplicationController
  before_action :find_shopping_bag
  before_action :authenticate_user!

  def show
    @products_in_bag = @shopping_bag.shopping_bag_products
  end

  private

  def find_shopping_bag
    @shopping_bag = current_user.shopping_bag
  end
end
