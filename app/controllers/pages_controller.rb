class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @products = Product.all
  end

  def dashboard
    @categories = Category.all
    @products = Product.all
  end
end
