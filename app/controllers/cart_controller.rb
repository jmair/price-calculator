class CartController < ApplicationController

  before_action 'get_products', :index

  def index
    @sale_items = Product.where(on_sale: true)

    if params[:quantity] || params[:item_list]
      cart = Cart.new

      result = cart.calculate_totals(params[:quantity], params[:item_list])
      @sale_applied_total = result[:total]
      @savings = result[:savings]
    end

    render 'index'
  end

  private

  def get_products
    @products = Product.all
  end
end
