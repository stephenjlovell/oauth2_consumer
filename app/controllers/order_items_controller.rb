class OrderItemsController < ApplicationController
  before_action :load_order, only: [:create]

  def create
    @order_item = OrderItem.new(product_id: params[:product_id], order_id: @order.id)
    redirect_to @order, notice: 'Successfully added product to cart.'
  end

  private

  def load_order
    @order = Order.where(id: session[:order_id], status: "unsubmitted").first_or_create
    session[:order_id] = @order.id
  end

end
