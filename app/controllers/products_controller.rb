class ProductsController < ApplicationController
  def create
    product = Product.new product_params

    if product.save
      head :created
    else
      head 404
    end
  end

  private

  def product_params
    params.permit(:name, :price, :category)
  end
end
