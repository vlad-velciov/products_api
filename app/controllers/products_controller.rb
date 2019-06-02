class ProductsController < ApplicationController


  def update
    return head :forbidden if includes_fields? ['name']
    super
  end

  private

  def includes_fields?(fields)
    !(params[:data][:attributes].keys & fields).empty?
  end
end
