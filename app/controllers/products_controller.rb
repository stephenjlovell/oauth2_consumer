class ProductsController < ApplicationController

  def index
    @products = Product.order("name").page(params[:page]).per_page(20)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :price, :stock)
    end
end
