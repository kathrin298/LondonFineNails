class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def show; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.category = find_category
    if @product.save
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to dashboard_path
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def find_category
    @category = Category.find(params[:product][:category_id])
  end

  def product_params
    params.require(:product).permit(:name, :brand, :sku, :size, :color, :available, :price, :category, :photo)
  end
end
