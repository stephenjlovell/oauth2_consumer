class OrdersController < ApplicationController
  before_action :authenticate_user!

  def checkout
    Order.find(session[:order_id]).update(status: "submitted")

    flash[:success] = "Thank you for shopping with us! A confirmation email will be arriving soon."
    redirect_to root_path
    session[:order_id] = nil  
  end

end