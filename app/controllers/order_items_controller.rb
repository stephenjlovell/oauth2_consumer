class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    load_order.order_items.create(product_id: params[:product_id])
    flash[:success] = 'Successfully added product to cart.'
    redirect_to order_items_path
  end

  def index
    @order = load_order
    @order_items = @order.order_items
  end

  def update
    OrderItem.find(params[:id]).update(update_params)
    flash[:success] = 'cart updated.'
    redirect_to order_items_path
  end

  def load_order
    order = Order.where(id: session[:order_id], status: "unsubmitted").first_or_create do |order|
      order.user_id = current_user.id if user_signed_in?
    end
    session[:order_id] = order.id
    order
  end

  private

  def update_params
    params.require(:order_item).permit(:quantity)
  end


end
