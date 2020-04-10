class ShoppingBagProductsController < ApplicationController
  before_action :find_product, only: [:create]
  before_action :find_shopping_bag_product, only: [:update, :destroy]

  def create
    # if current_user.shopping_bag
      @shopping_bag_product = ShoppingBagProduct.new(product: @product)
      @shopping_bag_product.shopping_bag = current_user.shopping_bag
      @shopping_bag_product.save
      redirect_to product_path(@product)
    # else
    #   @shopping_bag = ShoppingBag.create(user: current_user)
    #   @shopping_bag_product = ShoppingBagProduct.new(product: @product)
    #   @shopping_bag_product.shopping_bag = @shopping_bag
    #   @shopping_bag_product.save
    #   redirect_to product_path(@product)
    # end
  end

  def update
    @shopping_bag_product.update(shopping_bag_product_params)
    redirect_to shopping_bag_path(current_user.shopping_bag)
  end

  def destroy
    @shopping_bag_product.destroy
    redirect_to shopping_bag_path(current_user.shopping_bag)
  end

  private

  def shopping_bag_product_params
    params.require(:shopping_bag_product).permit(:quantity)
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

  def find_shopping_bag_product
    @shopping_bag_product = ShoppingBagProduct.find(params[:id])
  end
end
