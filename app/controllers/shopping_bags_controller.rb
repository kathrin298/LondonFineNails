class ShoppingBagsController < ApplicationController
  before_action :find_shopping_bag

  def show; end

  private

  def find_shopping_bag
    @shopping_bag = current_user.shopping_bag
  end
end
