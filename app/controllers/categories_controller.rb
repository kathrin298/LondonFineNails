class CategoriesController < ApplicationController
  before_action :find_category, only: [:edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to dashboard_path
  end

  private

  def find_category
   @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
