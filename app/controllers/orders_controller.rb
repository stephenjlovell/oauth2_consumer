class OrdersController < ApplicationController
  before_action :authenticate_user!

  def checkout
    Order.find(session[:order_id]).update(status: "submitted")

    flash[:success] = "Thank you for shopping with us! If we were a real company, " +
                      "an email confirmation would be arriving soon."
    redirect_to root_path
    session[:order_id] = nil  
  end

end